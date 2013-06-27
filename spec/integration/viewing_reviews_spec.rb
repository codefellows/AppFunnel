require 'spec_helper'

feature 'Viewing Reviews' do
  scenario 'view all reviews' do
    admin = Factory(:admin_user)
    sign_in_as!(admin)

    user = Factory(:user)
    profile = Factory(:profile, user_id: user.id)
    apn = Factory(:apn, profile_id: profile.id)
    review1 = Factory(:review, total: "14", apn_id: apn.id)

    visit '/'
    page.should have_content("14")
  end
end
