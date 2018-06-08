module Api
    module V1
        class AnswersController < ApplicationController
            def create
                question_id = params[:answer][:question_id]
                user = User.find_by(authorization_token: params[:answer][:authorization_token])
                answer = Answer.new(text: params[:answer][:text], user_id: user.id, question_id: question_id)
                if answer.save
                    render status: :created
                else
                    render status: :unprocessable_entity
                end
            end

            def update
                answer_id = params[:id]
                user = User.find_by(authorization_token: params[:answer][:authorization_token])
                text  = params[:answer][:text]

                answer = Answer.find(answer_id)

                if answer.user_id == user.id && answer.update_attributes(text: text)
                    render status: :ok
                else
                    render status: :unprocessable_entity
                end
            end
        end
    end
end