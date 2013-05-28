require 'spec_helper'

feature "Editing apns" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:profile) { Factory(:profile, user_id: user.id) }
  let!(:apn) { Factory(:apn, profile_id: profile.id) }

  scenario "edit an apn" do
    visit "/"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    click_link "The Dude"
    click_link "View Application"
    click_link "Edit Your Application"
    fill_in "Skype", with: "voice"
    click_button "Update Apn"
    page.should have_content("Your application has been updated.")
  end
end
