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

password = Digest::MD5.hexdigest("080411")
u = User.create(email: "kac.kurilov@yandex.ru", password_hash:password)
u.tokens.new(token: "ef71c9c42fa60baab5085b4667639694", user_agent: "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1")
u.save
