require 'spec_helper'

feature "Signing out" do

  before do
    user = Factory(:user, email: "spanky@cavendish.com")
    visit '/'
    fill_in "Email", with: "spanky@cavendish.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  scenario "Log out a user" do
    click_link "Log out"
    page.should have_content("You need to sign in or sign up before continuing.")
  end
end
