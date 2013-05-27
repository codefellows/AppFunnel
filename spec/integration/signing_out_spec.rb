require 'spec_helper'

feature "Signing out" do

  before do
    user = Factory(:user, email: "spanky@cavendish.com")
    user.confirm!
    visit '/'
    fill_in "Email", with: "spanky@cavendish.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  scenario "Sign out a user" do
    click_link "Sign out"
    page.should_not have_content("Signed in as")
  end
end
