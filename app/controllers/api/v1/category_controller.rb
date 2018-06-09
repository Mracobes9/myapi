module Api
    module V1
        class CategoryController < ApplicationController
            def index
                @categories = Category.all
            end
        end
    end
end
