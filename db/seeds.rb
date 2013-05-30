# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(:email => "spanky@cavendish.com", :password => "password")
user.confirm!

profile = Profile.create(first_name: "spanky", last_name: "cavendish", email: user.email,
               phone_number: "2065555555", city: "seattle", state: "WA",
               gender: "M", user_id: user_1.id)

Apn.create(profile_id: profile.id, why: "because I want to", diligent: "archery buff",
           cssfloat: "like root beer float", findout: "reggie told me", best: "q-tips",
           employment: "what?", skype: "spankyonskype", gplus: "spanksterC")


user_2 = User.create(email: "example@email.com", password: "password")
user_2.confirm!

profile_2 = Profile.create(first_name: "example", last_name: "last", email: user_2.email,
                           phone_number: "1111111111", city: "b'ham", state: "WA",
                           gender: "F", user_id: user_2.id)

Apn.create(profile_id: profile_2.id, why: "really really", diligent: "yus",
           cssfloat: "yes!", skype: "garblegarble", gplus: "geepluhs")

