class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :question_category_link, dependent: :destroy
    has_many :categories, through: :question_category_link
    belongs_to :user
end
