require 'spec_helper'

feature "Editing profiles" do
  before do
    user = Factory(:user, email: "spanky@cavendish.com")
    user.confirm!
    profile = Factory(:profile)

    visit '/'
    fill_in "Email", with: "spanky@cavendish.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  scenario "editing a profile" do
    click_link "The Dude"
    click_link "Edit Profile"
    fill_in "Gender", with: "Female"
    click_button "Update Profile"
    page.should have_content("Your profile has been updated.")
  end
end
