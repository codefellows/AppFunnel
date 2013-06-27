require 'spec_helper'

feature "Signing in" do
  before do
    user = Factory(:user, email: "spanky@cavendish.com")
    profile = Factory(:profile, email: "spanky@cavendish.com", user_id: user.id)
    application = Factory(:apn, profile_id: profile.id)
  end

  scenario "Signing in via form" do
      visit '/'
      within "#login" do # Ensures it signs in from the sign-in form not the sign-up form
        fill_in "Email", :with => "spanky@cavendish.com"
        fill_in "Password", :with => "password"
        click_button "Sign in"
      end
      page.should have_content("Signed in successfully.")
  end
end
