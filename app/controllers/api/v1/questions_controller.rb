module Api
    module V1
        class QuestionsController < ApplicationController
            before_action :authentificate
            before_action :get_question, only:[:update,:destroy]

            def create
                title = params[:question][:title]
                desc = params[:question][:desc]
                @question = Question.new(user: current_user, title: title, desc: desc)
                @question.categories = Category.where({id: params[:question][:categories_ids]})
                if @question.save
                    render status: :created
                else
                    render status: :unprocessable_entity
                end
            end

            def update
                if @question.isopen? && @question.update_attributes(question_params)
                    @question.categories = Category.where({id: params[:question][:categories_ids]})
                    render status: :ok
                else
                    render status: :unprocessable_entity
                end
            end

            def destroy
                if @question.destroy
                    render status: :ok
                else
                    render status: :unprocessable_entity
                end
            end

            private
            def get_question
                @question = current_user.questions.find(params[:id])
            end

            def question_params
                params.require(:question).permit(:categories_ids, :title, :desc, :isopen)
            end
        end
    end
end