require "spec_helper"

feature "Editing Reviews" do

  before do
    user = Factory(:user, id: 2)
    profile = Factory(:profile, id: 1, user_id: user.id)
    application = Factory(:apn, submitted: true, reviewed: true, id: 1, profile_id: profile.id)
    review = Factory(:review, id: 1, apn_id: application.id)
    admin = Factory(:admin_user)

    sign_in_as!(admin)

    visit '/'

    click_link "#{profile.first_name} #{profile.last_name}"

  end

  scenario "Reviewer should be able to edit reviews" do

    within("h2") {page.should have_content("Reviewing")}

    fill_in "Tags", with: "blue"
    page.select '4', from: "review_education"
    page.select '4', from: "review_contribution"
    page.select '4', from: "review_resume"
    page.select '1', from: "review_fit"
    page.select '1', from: "review_work_experience"
    page.select "Average", from: "review_exceptional"
    page.select "Decline", from: "review_decision"
    click_button "Update Review"
    page.should have_content("Review was successfully updated.")

  end

end
