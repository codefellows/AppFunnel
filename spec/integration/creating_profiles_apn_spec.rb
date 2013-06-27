require 'spec_helper'

feature "Creating profile and application" do
  before do
    user = Factory(:user)
    sign_in_as!(user)
    visit '/'
  end

  scenario "can submit an application" do
    fill_in "First name", with: "Spanky"
    fill_in "Last name", with: "Cavendish"
    fill_in "Email", with: "spanky@cavendish.com"
    fill_in "Phone number", with: "206555555"
    fill_in "City", with: "Seattle"
    fill_in "State", with: "Turkey"
    fill_in "Why do you want to join Code Fellows?", with: "Because it's awesome"
    fill_in "Tell us about a time when you learned a difficult skill", with: "There are too many times"
    fill_in "What is your experience programming? We don't require experience with Rails, but the best candidates will have some experience writing code.", with: "I studied for years"
    fill_in 'Technical question: What is CSS "float" property do?', with: "Magic!"
    fill_in "Where did you find out about us?", with: "In heaven"

    click_button "Submit Application"

    page.should have_content("Your application has been submitted.")
    profile = Profile.find_by_email("spanky@cavendish.com")
    page.current_url.should == profile_url(profile)
  end

  scenario "cannot submit an application with missing info" do
    fill_in "First name", with: "Spanky"
    fill_in "Last name", with: ""
    click_button "Submit Application"
    page.should have_content("Your application hasn't been created.")
  end

  scenario "can save an application with missing info" do
    fill_in "First name", with: "Spanky"
    fill_in "Last name", with: ""
    click_button "Save"
    page.should have_content("Your application has been saved.")
  end

end
