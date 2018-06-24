class User < ApplicationRecord
    has_many :answers
    has_many :questions
    has_many :tokens

    validates :email, uniqueness: {message: "Данный email уже использован"}, presence:{message:"Параметр email не заполнен"}
    validates :password_hash, presence: {message: "Параметр password не заполнен"} 

end
