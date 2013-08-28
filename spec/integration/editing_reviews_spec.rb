require "spec_helper"

feature "Editing Reviews" do

  before do
    review = Factory(:review)
    admin = Factory(:admin_user)

    sign_in_as!(admin)

    visit '/'

    click_link "#{review.apn.profile.first_name} #{review.apn.profile.last_name}"

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
    click_button "Update Review"
    page.should have_content("Review was successfully updated.")

  end

end
