# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(:email => "spanky@cavendish.com", :password => "password")
user.confirm!

Profile.create(first_name: "spanky", last_name: "cavendish", email: user.email,
               phone_number: "2065555555", city: "seattle", state: "WA",
               gender: "M")

