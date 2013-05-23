require 'spec_helper'

feature "Deleting apns" do
  let!(:apn) { Factory(:apn) }

  scenario "Deleting an apn" do
    visit apn_path(apn)
    click_link "Delete Your Application"
    page.should have_content("Your application has been deleted.")
  end
end
