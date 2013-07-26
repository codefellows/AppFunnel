require 'spec_helper'

feature "Creating classes" do
  before do
    user = Factory(:user)
    sign_in_as!(user)
    visit '/'
  end

  scenario "reviewer can create a new class" do
    pending('reviewer can create a new class')
    #click_link('New class')
    #fill_in "name" with: "Silver Boot camp"
    #fill_in "description" with: "This class will be a beginning coding boot camp to prepare you for the gold boot camp."
    #fill_in "desc_url" with: "http://codefellows.org"
    #fill_in "start date" with: "07/23/2013"
    #fill_in "end date" with: "08/23/2013"
    #fill_in "cost" with: "4000"
    #fill_in "Class type" with: "boot camp"
    #fill out application steps

  end

  scenario "reviewer can edit an existing class" do
    pending('reviewer can edit an existing class')

  end

  scenario "reviewer cannot delete a class" do
    pending('reviewer cannot delete a class')

  end
end
