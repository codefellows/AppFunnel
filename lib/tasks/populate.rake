namespace :db do
  desc "Erase and fill database with sample data"
  task populate: :environment do
    require "faker"

    @genders = ["Male","Female"]
    @employment = ["Employed", "Freelance", "Unemployed", "Looking for a job", "Student"]

    example_user = User.create(email: "example@email.com", password: "password")

    example_profile = Profile.create(
      user_id: example_user.id,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: example_user.email,
      phone_number: Faker::PhoneNumber.phone_number,
      city:    Faker::Address.city,
      state:   Faker::Address.state_abbr,
      gender: @genders[rand % 2],
      twitter: Faker::Internet.user_name,
      linkedin: Faker::Internet.user_name, 
      github: Faker::Internet.user_name
    )

    Apn.create(
      profile_id: example_profile.id,
      employment: @employment[rand % 5],
      skype: Faker::Internet.user_name,
      gplus: Faker::Internet.url,
      why: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
      diligent: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
      best: Faker::Lorem.paragraph(rand(1..5)),
      cssfloat: Faker::Lorem.paragraph(rand(1..5)),
      findout: Faker::Lorem.paragraph(rand(1..5)),
      experience: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
      recommendation: Faker::Internet.email
    )

    100.times do
      user = User.create(email: Faker::Internet.email,
                   password: "password")

      profile = Profile.create(
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

      Apn.create(
        profile_id: profile.id,
        employment: @employment[rand % 5],
        skype: Faker::Internet.user_name,
        gplus: Faker::Internet.user_name,
        why: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        diligent: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        best: Faker::Lorem.paragraph(rand(1..5)),
        cssfloat: Faker::Lorem.paragraph(rand(1..5)),
        findout: Faker::Lorem.paragraph(rand(1..5)),
        experience: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        recommendation: Faker::Internet.email
      )
    end
  end
end
