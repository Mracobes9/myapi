module Api
  module V1
    require "digest/md5"
    class UsersController < ApplicationController

      def create
        password = Digest::MD5.hexdigest(params[:user][:password])
        @user = User.new(email: params[:user][:email], password_hash: password)
        @user.tokens.new(token: generate_authorization_token, user_agent: request.user_agent)
        if @user.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      def signin
        if !params[:user][:email].nil? && !params[:user][:password].nil?
          @user = User.find_by(email: params[:user][:email])
          if @user.password_hash == Digest::MD5.hexdigest(params[:user][:password])
            update_token
            @user.save
            render status: :ok
          else
            render status: :unprocessable_entity
          end
        else
          render status: :bad_request
        end
      end

      def show
        @user = User.find(params[:id])
      end

      def answers
        @answers = User.find(params[:id]).answers
      end

      def questions
        @questions = User.find(params[:id]).questions
      end

      private

      def generate_authorization_token
        loop do
          token = SecureRandom.hex
          return token unless Token.exists?(token: token)
        end
      end

      def update_token
        current_token = @user.tokens.find_by(user_agent: request.user_agent)
        if current_token.nil?
          @user.tokens.new(token: generate_authorization_token, user_agent: request.user_agent)
        else
          current_token.token = generate_authorization_token
          current_token.save
        end
      end
    end
  end
end
