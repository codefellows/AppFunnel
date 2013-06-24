require 'spec_helper'

feature "Signing in" do
  before do
    Factory(:user, :email => "spanky@cavendish.com")
  end

  scenario "Signing in via form", js: true do
      visit '/'
      within "#login" do
        fill_in "Email", :with => "spanky@cavendish.com"
        fill_in "Password", :with => "password"
        binding.pry
        click_button "Sign in"
        page.should have_content("Signed in successfully.")
      end
  end
end
