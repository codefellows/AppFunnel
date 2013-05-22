require 'spec_helper'

feature "Signing up" do
  scenario "Successful sign up" do
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: "rater@school.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_link "Sign up"
    message = "Please open the link to activate your account."
    page.should have_content(message)
  end
end
