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

  ActsAsTaggableOn::Tag.create!(
               name: "javascript",
               )
  ActsAsTaggableOn::Tag.create!(
               name: "swift",
               )
  ActsAsTaggableOn::Tag.create!(
              name: "ios",
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
