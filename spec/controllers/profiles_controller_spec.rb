require 'spec_helper'

describe ProfilesController do
  include Devise::TestHelpers

  let(:user) { Factory(:confirmed_user) }
  let(:profile) { Factory(:profile) }

  context "standard users" do
    it "only shows users their own profile" do
      sign_in(:user, user)
      get :show, id: profile.id
      response.should redirect_to(root_path)
      flash[:alert] = "not authorized."
    end
  end
end
