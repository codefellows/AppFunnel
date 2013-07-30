require 'spec_helper'

feature "Editing classes" do
  before do
    admin = Factory(:admin_user)
    sign_in_as!(admin)
    visit '/'
  end

  scenario "reviewer can edit a class" do
    course = Factory(:course, :name => "Silver Boot Camp", :description => "This boot camp is cool")
    click_link('Manage Classes')
    click_link('Silver Boot Camp')
    click_link('Edit Class')
    fill_in "Description", with: "This class will be a beginning coding boot camp to prepare you for the gold boot camp."
    click_button 'Update Class'
    page.should have_content('Class has been updated.')
    page.should have_content("This class will be a beginning coding boot camp to prepare you for the gold boot camp.")
    page.should_not have_content("This boot camp is cool")

  end
end
