class Category < ApplicationRecord
    has_many :question_category_link, dependent: :destroy
    has_many :questions, through: :question_category_link
end
