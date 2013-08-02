require "spec_helper"

feature "Viewing Tags" do
    let!(:user) { Factory(:user) }
    let!(:profile) { Factory(:profile, user_id: user.id) }
    let!(:application) { Factory(:apn, submitted: true, reviewed: true, profile_id: profile.id) }
    let!(:review) { Factory(:review, apn_id: application.id, tag_list: "skillz, ios, bootcamp, current dev") }

    let!(:user2) { Factory(:user) }
    let!(:profile2) { Factory(:profile, first_name: "Jim", last_name: "Dude", user_id: user2.id) }
    let!(:application2) { Factory(:apn, submitted: true, reviewed: true, profile_id: profile2.id) }
    let!(:review2) { Factory(:review, apn_id: application2.id, tag_list: "mad skillz, ruby, python, retired") }

    let!(:user3) { Factory(:user) }
    let!(:profile3) { Factory(:profile, user_id: user3.id, first_name: "Albert") }
    let!(:application3) { Factory(:apn, submitted: true, reviewed: true, profile_id: profile3.id) }
    let!(:review3) { Factory(:review, apn_id: application3.id, tag_list: "mad skillz, ruby, python, retired, skillz, ios, current dev, bootcamp") }

  before do
    admin = Factory(:admin_user)
    sign_in_as!(admin)

    visit '/'

  end

  scenario "Reviewer should be able to view all tags" do
    review.tags.each { |tag| page.should have_content(tag)}
    review2.tags.each { |tag| page.should have_content(tag) }
    review3.tags.each { |tag| page.should have_content(tag) }
  end

  scenario "Review should be able to select a tag and view all reviews with that tag" do
    click_link "ruby"
    page.should have_content("#{profile3.first_name} #{profile3.last_name}")
    page.should have_content("#{profile2.first_name} #{profile2.last_name}")
    page.should_not have_content("#{profile.first_name} #{profile.last_name}")
  end

end
