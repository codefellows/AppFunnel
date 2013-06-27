require 'spec_helper'

feature "Editing profile and application" do
  before do
    user = Factory(:user, email: "spanky@cavendish.com")
    profile = Factory(:profile, email: "spanky@cavendish.com", user_id: user.id)
    application = Factory(:apn, profile_id: profile.id)
    sign_in_as!(user)
    click_link "Edit Application"
  end

  scenario "editing a profile" do
    choose "Female"
    click_button "Save"
    page.should have_content("Your application has been saved.")
  end

  scenario "editing an application" do
    fill_in "Why do you want to join Code Fellows?", with: "Because I LOVE CODING!"
    click_button "Save"
    page.should have_content("Your application has been saved.")
  end
end
