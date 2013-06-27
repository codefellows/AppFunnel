require 'spec_helper'

feature "Editing accounts" do
  before do
    user = Factory(:user)
    sign_in_as!(user)

  end

  scenario "Editing an account" do
    visit '/'
    click_link 'Account'
    page.should have_content("Edit Your Account")
  end
end
