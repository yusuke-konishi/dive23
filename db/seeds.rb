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

  ActsAsTaggableOn::Tag.create!(
               name: "javascript",taggings_count:1,
               )
  ActsAsTaggableOn::Tag.create!(
               name: "swift",taggings_count:2,
               )
  ActsAsTaggableOn::Tag.create!(
              name: "ios",taggings_count:3,
              )
  ActsAsTaggableOn::Tag.create!(
              name: "android",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "ruby-on-rails",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "php",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "java",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "python",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "ruby",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "monaca",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "xcode",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "objective-c",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "html",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "jquery",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "mysql",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "linux",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "css",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "c++",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "unity3d",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "onsen-ui",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "windows",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "angularjs",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "html5",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "git",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "visual-studio",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "node.js",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "iphone",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "android-studio",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "cakephp",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "go",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "centos",
              )
  ActsAsTaggableOn::Tag.create!(
              name: "sql",
              )
