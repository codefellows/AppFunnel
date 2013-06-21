require 'spec_helper'

feature "Signing in" do
  before do
    Factory(:user, :email => "spanky@cavendish.com")
  end

  scenario "Signing in via confirmation" do
    open_email "spanky@cavendish.com", :with_subject => /Confirmation/
    click_first_link_in_email
    page.should have_content("Your account was successfully confirmed")
  end

  scenario "Signing in via form" do
    User.find_by_email("spanky@cavendish.com").confirm!
    visit '/'
    fill_in "Email", :with => "spanky@cavendish.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
