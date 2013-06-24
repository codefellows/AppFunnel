require 'spec_helper'

feature 'Viewing Reviews' do
  scenario 'view all reviews' do
    user = Factory(:admin_user)
    review1 = Factory(:review, total: "14")
    review2 = Factory(:review, total: "56")

    sign_in_as!(user)
    page.should have_content("56")
  end
end
