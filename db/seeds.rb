# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "digest/md5"

20.times do |i|
    Category.create(title: Faker::ProgrammingLanguage.name)
end

1.times do |i|
    if i == 0
        password = Digest::MD5.hexdigest("080411")
        u = User.create(email: "kac.kurilov@yandex.ru", password_hash:password)
        u.tokens.new(token: "ef71c9c42fa60baab5085b4667639694")
        u.save
    end
end