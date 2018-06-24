class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :question

    validates :user_id,  presence:{message:"Параметр user_id не заполнен"}
    validates :question_id, presence:{message:"Параметр question_id не заполнен"}
    validates :text, presence:{message:"Параметр text не заполнен"}, length: {maximum: 100, message: "Превышено максимальное количество символов"}
    validates :user_id, uniqueness: {scope: :question_id, message: "Данный пользователь уже ответил на этот вопрос"}
    validates :question_id, uniqueness:{scope: :best, message: "Для данного вопроса уже существует лучший ответ"}, if: Proc.new {|a| a.best?}
    validates_each :question_id do |record, attr, value|
        record.errors.add(attr, "Данный вопрос закрыт. Добавление ответа невозможно") unless Question.find(value).isopen?
    end
end

