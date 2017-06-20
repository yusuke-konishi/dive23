# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do |i|
  name = "review0#{i+1} user"
  email = "review0#{i+1}@dive23.com"
  password = "password"
  uid = "review0#{i+1}"

  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               uid: uid,
               confirmed_at: Time.now
               )

  i = i + 1
end

3.times do |j|
  Question.create!(user_id: j+1,
               title: "review0#{j+1} user と申しますが…",
               content: "Rails がさっぱりわかりません。この先どうすれば…？"
               )

    3.times do |k|
      Answer.create!(question_id: j+1,
                  user_id: k+1,
                  content: "review0#{k+1} user と申しますが、どうにもなりません。"
                  )

      k = k + 1
    end

  j = j + 1
end
