# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

9.times do |i|
  name = "review0#{i+1} user"
  email = "review0#{i+1}@dive23.com"
  password = "password"
  uid = "review0#{i+1}"
  profile = "My name is review0#{i+1}. Ruby on Rails 歴 10#{i+1} 年です。"

  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               uid: uid,
               confirmed_at: Time.now,
               profile: profile
               )

  i = i + 1
end

9.times do |j|
  Question.create!(user_id: j+1,
               title: "review0#{j+1} user と申しますが…",
               content: "Rails がさっぱりわかりません。この先どうすれば…？"
               )

    9.times do |k|
      Answer.create!(question_id: j+1,
                  user_id: k+1,
                  content: "review0#{k+1} user と申しますが、どうにもなりません。"
                  )

      k = k + 1
    end

  j = j + 1
end
