require 'spec_helper'

feature "Deleting Profiles" do
  before do
    user = Factory(:user, email: "spanky@cavendish.com")
    user.confirm!
    profile = Factory(:profile)

    visit '/'
    fill_in "Email", with: "spanky@cavendish.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  scenario "delete a profile" do
    click_link "The Dude"
    click_link "Delete Profile"
    page.should have_content("Your profile has been deleted")
  end
end
