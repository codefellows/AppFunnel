# require 'spec_helper'

# feature "Creating Apns" do

#   before do
#     user = Factory(:confirmed_user)
#     profile = Factory(:profile, user_id: user.id, email: user.email) # name is "The Dude"
#     sign_in_as!(user)
#     click_link "The Dude"
#   end

#   scenario "Creating an apn" do
#     click_link "Create Application"
#     fill_in "Why", with: "because I really want to!"
#     click_button "Create Apn"
#     page.should have_content("Application submitted.")
#     page.should have_content("because I really want to!")
#   end

# end
