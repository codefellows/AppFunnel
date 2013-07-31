require "spec_helper"

feature "Creating Tags" do

  before do
    profile = Factory(:profile, first_name: "Oscar")
    application = Factory(:apn, profile_id: profile.id, reviewed: false)

    admin = Factory(:admin_user)
    sign_in_as!(admin)

    visit "/"
    click_link "Review a New Application"

  end

  scenario "Reviewer create a review" do
    within("h2") {page.should have_content("Reviewing")}
    within("h2") {page.should have_content("Oscar")}
    fill_in "Tags", with: "awesome"
    within("#review_education") { select "1" }
    within("#review_contribution") { select "1" }
    within("#review_resume") { select "1" }
    within("#review_fit") { select "1" }
    within("#review_work_experience") { select "1" }
    within("#review_exceptional") { select "Average" }
    within("#review_decision") { select "Decline"}
    click_button "Create Review"

    click_link "Oscar"
    within("h1") {page.should have_content("Editing review")}
    within("h2") {page.should have_content("Reviewing")}
    within("h2") {page.should have_content("Oscar")}
  end
end
