class Category < ApplicationRecord
    has_many :question_category_link
    has_many :questions, through: :question_category_link
end
