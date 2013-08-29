namespace :db do
  desc "Erase and fill database with sample data"
  task populate: :environment do
    require "faker"

    @genders = ["Male","Female"]
    @employment = ["Employed", "Freelance", "Unemployed", "Looking for a job", "Student"]
    @ratings = [1, 2, 3, 4]
    @cost = [3000, 5000, 4000]
    @course_type = ["Bootcamp", "Workshop", "Evening Class"]
    @capacity = [20, 25, 30]
    @tags = [ ["follow-up", "repeat applicant", "phone call"], ["attended workshop", "CS degree", "UX experience"], ["phone call", "entrepreneur"]]
    @decisions = ["Undecided", "Decline", "Request Video", "Request Interview", "Accepted"]
    example_user = User.create(email: "example@email.com", password: "password")

    example_profile = Profile.create(
      user_id: example_user.id,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: example_user.email,
      phone_number: Faker::PhoneNumber.phone_number,
      city:    Faker::Address.city,
      state:   Faker::Address.state_abbr,
      gender: @genders[rand(0..1)],
      twitter: Faker::Internet.user_name,
      linkedin: Faker::Internet.user_name,
      github: Faker::Internet.user_name
    )

    example_apn = Apn.create(
      profile_id: example_profile.id,
      employment: @employment[rand(0..4)],
      skype: Faker::Internet.user_name,
      gplus: Faker::Internet.url,
      why: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
      diligent: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
      best: Faker::Lorem.paragraph(rand(1..5)),
      cssfloat: Faker::Lorem.paragraph(rand(1..5)),
      findout: Faker::Lorem.paragraph(rand(1..5)),
      experience: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
      recommendation: Faker::Internet.email,
      submitted: true,
      reviewed: true
    )

    example_review = Review.create(
      user_id: 1,
      apn_id: example_apn.id,
      education: @ratings[rand(0..3)],
      contribution: @ratings[rand(0..3)],
      resume: @ratings[rand(0..3)],
      fit: @ratings[rand(0..3)],
      work_experience: @ratings[rand(0..3)],
      exceptional: rand(-1..1)
    )

    example_review.tag_list = @tags[rand(0..2)]
    example_review.save

    example_past_course1 = Course.create(
      name: Faker::Internet.user_name,
      description: Faker::Lorem.paragraph(rand(1..5)),
      desc_url: Faker::Internet.domain_name,
      start_date: "2013-7-04",
      end_date: "2013-9-04",
      cost: @cost[rand(0..2)],
      course_type: @course_type[rand(0..2)],
      capacity: @capacity[rand(0..2)]
    )

    example_past_course1 = Course.create(
      name: Faker::Internet.user_name,
      description: Faker::Lorem.paragraph(rand(1..5)),
      desc_url: Faker::Internet.domain_name,
      start_date: "2013-7-01",
      end_date: "2013-8-04",
      cost: @cost[rand(0..2)],
      course_type: @course_type[rand(0..2)],
      capacity: @capacity[rand(0..2)]
    )

    example_course_registrations = CourseRegistration.create(
      apn_id: example_apn.id,
      course_id: example_past_course1.id,
      decision: @decisions[rand(0..4)]
    )

    #create 8 future courses
    @start_date = ["2013-10-04", "2013-11-01", "2013-12-08"]
    @end_date = ["2014-01-04", "2014-03-01", "2013-05-08"]
    @course_names = ["Rails", "Python", "IOS", "Unicorn", "Javascript"]
    8.times do
      Course.create(
        name: @course_names[rand(0..4)],
        description: Faker::Lorem.paragraph(rand(1..5)),
        desc_url: Faker::Internet.domain_name,
        start_date: @start_date[rand(0..2)],
        end_date: @end_date[rand(0..2)],
        cost: @cost[rand(0..2)],
        course_type: @course_type[rand(0..2)],
        capacity: @capacity[rand(0..2)]
      )
    end

    # Create 50 unreviewed applications
    50.times do
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
        gender: @genders[rand(0..1)],
        twitter: Faker::Internet.user_name,
        linkedin: Faker::Internet.user_name,
        github: Faker::Internet.user_name
      )

      apn = Apn.create(
        profile_id: profile.id,
        employment: @employment[rand(0..4)],
        skype: Faker::Internet.user_name,
        gplus: Faker::Internet.user_name,
        why: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        diligent: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        best: Faker::Lorem.paragraph(rand(1..5)),
        cssfloat: Faker::Lorem.paragraph(rand(1..5)),
        findout: Faker::Lorem.paragraph(rand(1..5)),
        experience: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        recommendation: Faker::Internet.email,
        submitted: true
      )

      course_registrations = CourseRegistration.create(
        apn_id: apn.id,
        course_id: rand(0..4),
        decision: @decisions[rand(0..4)]
      )

      course_registrations = CourseRegistration.create(
        apn_id: apn.id,
        course_id: rand(5..10),
        decision: @decisions[rand(0..4)]
      )

    end

    # Create 50 reviewed applications
    50.times do
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
        gender: @genders[rand(0..1)],
        twitter: Faker::Internet.user_name,
        linkedin: Faker::Internet.user_name,
        github: Faker::Internet.user_name
      )

      apn = Apn.create(
        profile_id: profile.id,
        employment: @employment[rand(0..4)],
        skype: Faker::Internet.user_name,
        gplus: Faker::Internet.user_name,
        why: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        diligent: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        best: Faker::Lorem.paragraph(rand(1..5)),
        cssfloat: Faker::Lorem.paragraph(rand(1..5)),
        findout: Faker::Lorem.paragraph(rand(1..5)),
        experience: Faker::Lorem.paragraphs(rand(1..5)).join("\n"),
        recommendation: Faker::Internet.email,
        submitted: true,
        reviewed: true
      )

      review = Review.create(
        user_id: 1,
        apn_id: apn.id,
        education: @ratings[rand(0..3)],
        contribution: @ratings[rand(0..3)],
        resume: @ratings[rand(0..3)],
        fit: @ratings[rand(0..3)],
        work_experience: @ratings[rand(0..3)],
        exceptional: rand(-1..1)
      )
      review.tag_list = @tags[rand(0..2)]
      review.save

      course_registrations = CourseRegistration.create(
        apn_id: apn.id,
        course_id: rand(0..4),
        decision: @decisions[rand(0..4)]
      )

      course_registrations = CourseRegistration.create(
        apn_id: apn.id,
        course_id: rand(5..10),
        decision: @decisions[rand(0..4)]
      )
    end
  end
end
