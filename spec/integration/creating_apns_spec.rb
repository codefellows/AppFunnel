require 'spec_helper'

feature "Creating Apns" do
  before do
    profile = Factory(:profile) # name is "The Dude"
  end

  scenario "Creating an apn" do
    visit "/"
    click_link "The Dude"
    click_link "Create Application"
    fill_in "Why", with: "because I really want to!"
    click_button "Create Apn"
    page.should have_content("Application submitted.")
    page.should have_content("because I really want to!")
  end
end
