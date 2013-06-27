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
  end
end
