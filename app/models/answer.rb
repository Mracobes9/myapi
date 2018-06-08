class Answer < ApplicationRecord
    belongs_to :user
    has_many :question_answer_link
end
