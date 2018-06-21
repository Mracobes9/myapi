module Api
    module V1
        class AnswersController < ApplicationController
            before_action :exist_user, only:[:create, :update, :destroy]
            before_action :correct_user, only:[:update, :destroy]

            def create
                question_id = params[:answer][:question_id]
                answer = Answer.new(text: params[:answer][:text], user_id: @user.id, question_id: question_id)
                if Question.find(question_id).isopen? && answer.save
                    render status: :created
                else
                    render status: :unprocessable_entity
                end
            end

            def update
                text  = params[:answer][:text]
                if @answer.update_attributes(text: text)
                    render status: :ok
                else
                    render status: :unprocessable_entity
                end
            end

            def destroy
                if @answer.destroy
                    render status: :ok
                else
                    render status: :unprocessable_entity
                end
            end

            private

            def exist_user
                @user = User.find_by(authorization_token: params[:authorization_token])
                render status: :unauthorized if @user.nil?
            end

            def correct_user
                @answer = Answer.find(params[:id])
                render status: :bad_request if @answer.user_id != @user.id
            end
        end
    end
end