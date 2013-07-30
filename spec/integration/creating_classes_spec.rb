require 'spec_helper'

feature "Creating classes" do
  before do
    admin = Factory(:admin_user)
    sign_in_as!(admin)
    visit '/'
  end

  scenario "reviewer can create a new class" do
    #pending('reviewer can create a new class')
    click_link('Manage Classes')
    click_link('New Class')
    fill_in "Name", with: "Silver Boot camp"
    fill_in "Description", with: "This class will be a beginning coding boot camp to prepare you for the gold boot camp."
    fill_in "Desc url", with: "http://codefellows.org"
    page.select 'July', :from => 'course[start_date(2i)]'
    page.select '2013', :from => 'course[start_date(1i)]'
    page.select '17', :from => 'course[start_date(3i)]'
    page.select 'August', :from => 'course[end_date(2i)]'
    page.select '2013', :from => 'course[end_date(1i)]'
    page.select '17', :from => 'course[end_date(3i)]'
    fill_in "Cost", with: "4000"
    fill_in "Course type", with: "boot camp"
    click_button 'Create Class'
    page.should have_content('Class has been created.')
    #fill out application steps
    #verify it commited.

  end
end
