require 'spec_helper'

feature "Deleting apns" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:profile) { Factory(:profile, user_id: user.id) }
  let!(:apn) { Factory(:apn, profile_id: profile.id) }

  scenario "Deleting an apn" do
    visit "/"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    click_link "The Dude"
    click_link "View Application"
    click_link "Delete Your Application"
    page.should have_content("Your application has been deleted.")
  end
end
