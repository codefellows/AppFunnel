FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@cavendish.com" }
    password "password"
    password_confirmation "password"

    factory :admin_user do
      after_create do |user|
        user.update_attribute(:admin, true)
      end
    end
  end

end
