require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :user_id => 1,
      :apn_id => 1,
      :education => 1,
      :contribution => 1,
      :resume => 1,
      :fit => 1,
      :work_experience => 1,
      :note => "MyText",
      :exceptional => 1
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "input#review_user_id[name=?]", "review[user_id]"
      assert_select "input#review_apn_id[name=?]", "review[apn_id]"
      assert_select "input#review_education[name=?]", "review[education]"
      assert_select "input#review_contribution[name=?]", "review[contribution]"
      assert_select "input#review_resume[name=?]", "review[resume]"
      assert_select "input#review_fit[name=?]", "review[fit]"
      assert_select "input#review_work_experience[name=?]", "review[work_experience]"
      assert_select "textarea#review_note[name=?]", "review[note]"
      assert_select "input#review_exceptional[name=?]", "review[exceptional]"
    end
  end
end
