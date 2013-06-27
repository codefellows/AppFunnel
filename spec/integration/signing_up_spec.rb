require 'spec_helper'

feature "Signing up" do
  scenario "Successful sign up" do
    visit '/'
    fill_in "Email", with: "spanky@cavendish.com" 
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    message = "Welcome! You have signed up successfully."
    page.should have_content(message)
  end
end
