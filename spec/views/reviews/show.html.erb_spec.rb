require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :user_id => 1,
      :apn_id => 2,
      :education => 3,
      :contribution => 4,
      :resume => 5,
      :fit => 6,
      :work_experience => 7,
      :note => "MyText",
      :exceptional => 8
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/MyText/)
    rendered.should match(/8/)
  end
end
