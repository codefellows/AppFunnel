require 'spec_helper'

describe "reviews/index" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :user_id => 1,
        :apn_id => 2,
        :education => 3,
        :contribution => 4,
        :resume => 5,
        :fit => 6,
        :work_experience => 7,
        :note => "MyText",
        :exceptional => 8
      ),
      stub_model(Review,
        :user_id => 1,
        :apn_id => 2,
        :education => 3,
        :contribution => 4,
        :resume => 5,
        :fit => 6,
        :work_experience => 7,
        :note => "MyText",
        :exceptional => 8
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
  end
end
