class User < ApplicationRecord
    has_many :answers
    has_many :questions
    has_many :tokens
end
