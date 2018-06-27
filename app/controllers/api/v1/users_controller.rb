module Api
  module V1
    class UsersController < ApplicationController

      def show
        @user = User.find(params[:id])
      end

      def answers
        @answers = User.find(params[:id]).answers
      end

      def questions
        @questions = User.find(params[:id]).questions
      end
    end
  end
end
