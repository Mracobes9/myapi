module Api
    module V1
        class CategoryController < ApplicationController

            def show
                @category = Category.find(params[:id])
            end

            def index
                @categories = Category.all
            end

            def questions
                @questions = Category.find(params[:id]).questions
            end
        end
    end
end
