module Api
    module V1
        class AnswersController < ApplicationController
            before_action :authentificate, only:[:create, :update, :destroy]
            before_action :get_answer, only:[:update, :destroy]

            def create
                question = Question.find(params[:answer][:question_id])
                @answer = Answer.new(text: params[:answer][:text], user: current_user, question: question)
                
                if question.isopen? && @answer.save
                    render status: :created
                else
                    @answer.valid?
                    render status: :unprocessable_entity
                end
            end

            def update
                text  = params[:answer][:text]
                best = params[:answer][:best].nil? ? false : params[:answer][:best]
                if @answer.update_attributes(text: text, best: best)
                    @answer.question.update_attributes(isopen: false)
                    render status: :ok
                else
                    @answer.valid?
                    render status: :unprocessable_entity
                end
            end

            def destroy
                if @answer.destroy
                    render status: :ok
                else
                    @answer.valid?
                    render status: :unprocessable_entity
                end
            end

            private
            def get_answer
                @answer = Answer.find(params[:id])
                render status: :bad_request if @answer.user != current_user
            end
        end
    end
end