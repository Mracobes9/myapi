module Api
  module V1
    require "digest/md5"
    class UsersController < ApplicationController

      def create
        password = Digest::MD5.hexdigest(params[:user][:password])
        @user = User.new(email: params[:user][:email], password_hash: password,authorization_token: generate_authorization_token)
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
            render status: :ok
          else
            render status: :unprocessable_entity
          end
        else
          render status: :bad_request
        end
      end

      private

      def generate_authorization_token
        loop do
          token = SecureRandom.hex
          return token unless User.exists?(authorization_token: token)
        end
      end

    end
  end
end
