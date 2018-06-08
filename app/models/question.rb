class Question < ApplicationRecord
    has_many :answers
    has_many :question_answer_link
    belongs_to :user
end
