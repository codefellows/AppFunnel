require "spec_helper"

feature "Creating Tags" do

  before do

    admin = Factory(:admin_user)
    sign_in_as!(admin)

    visit "/"
    click_link "Review a New Application"

  end

  scenario "Reviewer can add a tag to an application" do
    click_link "Add tag"
    fill_in "Tag", with: "awesome applicant!"
    within(".tag") { page.should have_content("awesome applicant!")}
  end

end
