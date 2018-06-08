module Api
    module V1
        class QuestionsController < ApplicationController
            def create
                user = User.find_by(authorization_token: params[:question][:authorization_token])
                title = params[:question][:title]
                desc = params[:question][:text]
                question = Question.new(user_id:user.id, title: title, desc: desc)
                question.categories = Category.where({id: params[:question][:categories_ids]})

                if question.save
                    render status: :created
                else
                    render status: :unprocessable_entity
                end
            end

            def update
            end
        end
    end
end