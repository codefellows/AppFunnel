require 'spec_helper'

feature 'Viewing Reviews' do
    let!(:user) { Factory(:user) }
    let!(:profile) { Factory(:profile, user_id: user.id) }
    let!(:application) { Factory(:apn, submitted: true, reviewed: false, profile_id: profile.id) }

    let!(:user2) { Factory(:user) }
    let!(:profile2) { Factory(:profile, first_name: "Jim", last_name: "Dude", user_id: user2.id) }
    let!(:application2) { Factory(:apn, submitted: false, reviewed: false, profile_id: profile2.id) }
    let!(:review) { Factory(:review, total: "14", apn_id: application.id) }

  before do
    admin = Factory(:admin_user)
    sign_in_as!(admin)
    visit '/'
  end

  scenario 'view all reviews' do
    page.should have_content("14")
  end

  scenario "Reviewer should not view unsubmitted applications" do
    click_link "View All Unreviewed Applications"
    page.should have_content profile.first_name
    page.should_not have_content profile2.first_name
  end

end
