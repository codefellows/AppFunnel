namespace :db do
  desc "Erase and fill database with sample data"
  task populate: :environment do
    require "faker"

    @genders = ["Male","Female"]
    @employment = ["Employed", "Freelance", "Unemployed", "Looking for a job", "Student"]

    [Profile, Apn, User].each(&:delete_all)

    admin_user = User.create(email: "admin@admin.com", password: "password", admin: true)
    admin_user.confirm!

    test_user = User.create(email: "example@email.com", password: "password")
    test_user.confirm!

    test_profile = Profile.create(first_name: "example", last_name: "last", email: test_user.email,
                               phone_number: "1111111111", city: "b'ham", state: "WA",
                               gender: "F", user_id: test_user.id)

    100.times do
      user = User.create!(email: Faker::Internet.email,
                   password: "password")
      user.confirm!

      profile = Profile.create!(
        user_id: user.id,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: user.email,
        phone_number: Faker::PhoneNumber.phone_number,
        city:    Faker::Address.city,
        state:   Faker::Address.state_abbr,
        gender: @genders[rand % 2],
        twitter: Faker::Internet.user_name,
        linkedin: Faker::Internet.user_name, 
        github: Faker::Internet.user_name
      )

      Apn.create!(
        profile_id: profile.id,
        employment: @employment[rand % 5],
        skype: Faker::Internet.user_name,
        gplus: Faker::Internet.user_name,
        why: Faker::Lorem.paragraphs(paragraph_count = 2, supplemental = false),
        diligent: Faker::Lorem.paragraphs(paragraph_count = 2, supplemental = false),
        best: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false),
        cssfloat: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false),
        findout: Faker::Lorem.paragraph(sentence_count = 1, supplemental = false),
        experience: Faker::Lorem.paragraphs(paragraph_count = 2, supplemental = false),
        recommendation: Faker::Lorem.paragraph(sentence_count = 1, supplemental = false)
      )
    end
  end
end
