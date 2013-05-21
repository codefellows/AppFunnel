require 'spec_helper'

feature "Creating profiles" do

  scenario "can create a profile" do
    visit '/'
    click_link "New Profile"
    fill_in "First name", with: "Spanky"
    fill_in "Last name", with: "Cavendish"
    fill_in "Email", with: "spanky@cavendish.info"
    fill_in "Phone number", with: "206555555"
    fill_in "City", with: "Seattle"
    fill_in "State", with: "Turkey"
    fill_in "Gender", with: "?????"
    # fill_in "Employment status", with: "down by the river"
    click_button "Create Profile"
    page.should have_content("Your profile has been created.")
    profile = Profile.find_by_email("spanky@cavendish.info")
    page.current_url.should == profile_url(profile)
  end

  scenario "cannot create a profile with missing info" do
    visit '/'
    click_link "New Profile"
    fill_in "First name", with: "Spanky"
    fill_in "Last name", with: ""
    fill_in "Email", with: "spanky@cavendish.info"
    fill_in "Phone number", with: "206555555"
    fill_in "City", with: "Seattle"
    fill_in "State", with: "Turkey"
    fill_in "Gender", with: "?????"
    # fill_in "Employment status", with: "down by the river"
    click_button "Create Profile"
    page.should have_content("Your profile hasn't been created.")
  end

end
