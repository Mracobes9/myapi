class Question < ApplicationRecord
    has_many :answers
    has_many :question_category_link
    has_many :categories, through: :question_category_link
    belongs_to :user
end
