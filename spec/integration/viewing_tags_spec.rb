require "spec_helper"

feature "Viewing Tags" do
    let!(:user) { Factory(:user) }
    let!(:profile) { Factory(:profile, user_id: user.id) }
    let!(:application) { Factory(:apn, submitted: true, reviewed: true, profile_id: profile.id) }
    let!(:review) { Factory(:review, apn_id: application.id, tag_list: "skillz, ios, bootcamp, current dev") }

    let!(:user2) { Factory(:user) }
    let!(:profile2) { Factory(:profile, user_id: user2.id, first_name: "Jim") }
    let!(:application2) { Factory(:apn, submitted: true, reviewed: true, profile_id: profile.id) }
    let!(:review2) { Factory(:review, apn_id: application.id, tag_list: "mad skillz, ruby, python, retired") }

    let!(:user3) { Factory(:user) }
    let!(:profile3) { Factory(:profile, user_id: user3.id, first_name: "Albert") }
    let!(:application3) { Factory(:apn, submitted: true, reviewed: true, profile_id: profile.id) }
    let!(:review3) { Factory(:review, apn_id: application.id, tag_list: "mad skillz, ruby, python, retired, skillz, ios, current dev, bootcamp") }

  before do
    admin = Factory(:admin_user)
    sign_in_as!(admin)

    visit '/'
    click_link "Manage Tags"
  end

  scenario "Reviewer should be able to view all tags" do

    all_tags = []
    review.tags.each { |tag| all_tags |= [tag.name] }
    review2.tags.each { |tag| all_tags |= [tag.name] }
    review3.tags.each { |tag| all_tags |= [tag.name] }
    all_tags.each { |tag| page.should have_content(tag) }
  end

end
