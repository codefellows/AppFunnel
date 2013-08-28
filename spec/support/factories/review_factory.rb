FactoryGirl.define do
  factory :review do
    education "1"
    contribution "1"
    resume "1"
    fit "1"
    work_experience "1"
    total "14"
    exceptional "1"
    created_at "2013-07-23 20:47:48"
    updated_at "2013-07-31 22:44:54"

    association :apn
  end
end

