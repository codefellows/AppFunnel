require 'spec_helper'

feature "editing an apn" do
  let!(:profile) { Factory(:profile) }
  let!(:apn) { Factory(:apn) }

  scenario "edit an apn" do
    visit apn_path(apn)
    click_link "Edit Your Application"
    fill_in "Skype", with: "voice"
    click_button "Update Apn"
    page.should have_content("Your application has been updated.")
  end
end
