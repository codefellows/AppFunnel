FactoryGirl.define do
  factory :profile do
    first_name "The"
    last_name "Dude"
    email :email
    phone_number "3602012204"
    city "Seattle"
    state "WA"
    gender "Male"
    user_id = 1
    twitter "blah"
    linkedin "blech"
    github "blerg"
    created_at "2013-07-31 22:11:35"
    updated_at "2013-07-31 22:11:35"
 end
end
