require 'spec_helper'

feature "Signing out" do
  scenario "Log out a user" do
    user = Factory(:user)
    sign_in_as!(user)
    visit '/'
    click_link "Log Out"
    page.should have_content("You need to sign in or sign up before continuing.")
  end
end
