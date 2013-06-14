# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..10).each do |n|

  user = User.create(:email => "spanky#{n}@cavendish.com", :password => "password")
  user.confirm!

  profile = Profile.create(first_name: "percivel#{n}", last_name: "cavendish", email: user.email,
                 phone_number: "2065555555", city: "seattle", state: "WA",
                 gender: "M")

  Apn.create(profile_id: profile.id,
             why: "Well, I've wanted to shave yaks for about as long as I can remember." +
             " I mean, can you THINK of a more ridiculous looking animal once all its" +
             " hair's gone? Not to mention how good a metaphor it makes -- both the" +
             " shaved yak and the actual act of shaving it, that is. At any rate, if" +
             " I'm accepted I'll definitely be in the top, like, baker's dozen or so" +
             " yak-shavers you've ever laid eyes upon.",
             diligent: "huuuuuuuuuuuuuuuuuuuuuuuuuuuuge archery buff",
             experience:"a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot a lot ",
             cssfloat: "basically like root beer float, yeah?",
             findout: "reggie told me", best: "q-tips",
             employment: "what?", skype: "mrpercivaltoyou", gplus: "percival")
end

user_2 = User.create(email: "example@email.com", password: "password")
user_2.confirm!

profile_2 = Profile.create(first_name: "example", last_name: "last", email: user_2.email,
                           phone_number: "1111111111", city: "b'ham", state: "WA",
                           gender: "F", user_id: user_2.id)

Apn.create(profile_id: profile_2.id, why: "really really", diligent: "yus",
           cssfloat: "yes!", skype: "garblegarble", gplus: "geepluhs", experience: "Insane amunnntss")

admin_user = User.create(email: "admin@admin.com", password: "password", admin: true)
admin_user.confirm!

