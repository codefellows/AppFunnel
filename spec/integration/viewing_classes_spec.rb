require 'spec_helper'

feature "Viewing classes" do
  before do
    admin = Factory(:admin_user)
    sign_in_as!(admin)
    visit '/'
  end

  scenario "reviewer can view classes" do
    Factory(:course, name:"Silver Boot camp")
    click_link('Manage Classes')
    page.should have_content("Silver Boot camp")
  end
end
