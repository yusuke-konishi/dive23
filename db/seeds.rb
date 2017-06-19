# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do |m|
  name = "review0#{m+1} user"
  email = "review0#{m+1}@dive23.com"
  password = "password"
  uid = "review0#{m+1}"

  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               uid: uid,
               )

  user = User.find(m+1)
  user.update(confirmed_at: Time.now)

  m = m + 1
end
