require 'spec_helper'

feature "Viewing profiles" do
  before do
    user = Factory(:user, email: "spanky@cavendish.com")
    user.confirm!
    profile = Factory(:profile)

    visit '/'
    fill_in "Email", with: "spanky@cavendish.com"
    fill_in "Password", with: "password"
    click_button "Sign in"

  end

  scenario "viewing a profile" do
    click_link "The Dude"
    page.should have_content("Here You Are")
  end
end
