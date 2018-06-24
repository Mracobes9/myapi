class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :question_category_link, dependent: :destroy
    has_many :categories, through: :question_category_link
    belongs_to :user

    validates :title, presence: {message: "Параметр title не заполнен"}, length:{maximum:30, message: "Превышено максимальное количество символов"}
    validates :desc, presence:{message: "Параметр desc не заполнен"}, length:{maximum:100, message:"Превышено максимальное количество символов"}
    validates :user_id, presence: {message:"Параметр user_id не заполнен"}
end
