require "spec_helper"

feature "Viewing Tags" do

    let!(:profile) { Factory(:profile, first_name: "Jim", last_name: "Bob") }
    let!(:application) { Factory(:apn, submitted: true, reviewed: true, profile_id: profile.id) }
    let!(:review) { Factory(:review, apn_id: application.id, tag_list: "skillz, ios, bootcamp, current dev") }

    let!(:review2) { Factory(:review, tag_list: "mad skillz, ruby, python, retired") }

  before do
    admin = Factory(:admin_user)
    sign_in_as!(admin)

    visit '/'
  end

  scenario "Reviewer should be able to view all tags" do
    review.tags.each { |tag| page.should have_content(tag)}
    review2.tags.each { |tag| page.should have_content(tag) }
  end

  scenario "Review should be able to select a tag and view all reviews with that tag" do
    click_link "ruby"
    page.should have_content("#{review2.apn.profile.first_name} #{review2.apn.profile.last_name}")
    page.should_not have_content("#{review.apn.profile.first_name} #{review.apn.profile.last_name}")
  end

end
