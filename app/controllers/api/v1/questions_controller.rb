module Api
    module V1
        class QuestionsController < ApplicationController
            def create
                user = User.find_by(authorization_token: params[:question][:authorization_token])
                title = params[:question][:title]
                desc = params[:question][:desc]
                question = Question.new(user_id:user.id, title: title, desc: desc)
                question.categories = Category.where({id: params[:question][:categories_ids]})

                if question.save
                    render status: :created
                else
                    render status: :unprocessable_entity
                end
            end

            def update
                question = Question.find(params[:id])
                user = User.find_by(authorization_token:params[:authorization_token])

                if question.user_id == user.id && question.update_attributes(question_params)
                    question.categories = Category.where({id: params[:question][:categories_ids]})
                    render status: :ok
                else
                    render status: :unprocessable_entity
                end
            end

            def destroy
                user = User.find_by(authorization_token:params[:authorization_token])
                question = Question.find(params[:id])

                if question.user_id == user.id && question.destroy
                    render status: :ok
                else
                    render status: :unprocessable_entity
                end
            end

            private

            def question_params
                params.require(:question).permit(:categories_ids, :title, :desc)
            end
        end
    end
end