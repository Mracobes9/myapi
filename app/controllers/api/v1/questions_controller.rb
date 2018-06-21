module Api
    module V1
        class QuestionsController < ApplicationController
            before_action :exist_user
            before_action :correct_user, only:[:update,:destroy]

            def create
                title = params[:question][:title]
                desc = params[:question][:desc]
                question = Question.new(user_id:@user.id, title: title, desc: desc)
                question.categories = Category.where({id: params[:question][:categories_ids]})

                if question.save
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

            def current_user
                @user ||= User.find_by(authorization_token: params[:authorization_token])
            end

            def set_question
                @question = exist_user.questions.find(params[:id])
            end

            def question_params
                params.require(:question).permit(:categories_ids, :title, :desc, :isopen)
            end
        end
    end
end