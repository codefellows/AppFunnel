require "spec_helper"

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

describe Permission do

  describe "as admin with own profile" do
    user = Factory(:admin_user, email: "asd@cavendish.com")
    profile = Factory(:profile, email: "asd@cavendish.com", user_id: user.id)
    subject { Permission.new(user) }
    it { should allow("profiles", "show", profile.id) }
    it { should allow("profiles", "new", profile.id) }
    it { should allow("profiles", "create", profile.id) }
    it { should allow("profiles", "edit", profile.id) }
    it { should allow("profiles", "update", profile.id) }
    it { should allow("profiles", "destroy", profile.id) }
    it { should_not allow("profiles", "index", profile.id) }
  end

  describe "as admin with other's profile" do
    user = Factory(:admin_user, email: "admin@email.com")
    user_profile = Factory(:profile, user_id: user.id, email: user.email )
    user_2 = Factory(:user, email: "pickles2@smith.com")
    user_2_profile = Factory(:profile, user_id: user_2.id, email: user_2.email)
    subject { Permission.new(user) }

    it { should allow("profiles", "show", user_2_profile.id) }
    it { should allow("profiles", "new", user_2_profile.id) }
    it { should allow("profiles", "create", user_2_profile.id) }
    it { should allow("profiles", "edit", user_2_profile.id) }
    it { should allow("profiles", "update", user_2_profile.id) }
    it { should allow("profiles", "destroy", user_2_profile.id) }
    it { should_not allow("profiles", "index", user_2_profile.id) }
  end

  describe "as user with own profile" do
    user = Factory(:user, email: "spanky@cavendish.com")
    profile = Factory(:profile, email: "spanky@cavendish.com", user_id: user.id)
    subject { Permission.new(user) }
    it { should allow("profiles", "show", profile.id) }
    it { should allow("profiles", "new", profile.id) }
    it { should allow("profiles", "create", profile.id) }
    it { should allow("profiles", "edit", profile.id) }
    it { should allow("profiles", "update", profile.id) }
    it { should allow("profiles", "destroy", profile.id) }
    it { should_not allow("profiles", "index", profile.id) }
  end

  describe "as user with other's profile" do
    user = Factory(:user, email: "some@email.com")
    user_profile = Factory(:profile, user_id: user.id, email: user.email )
    user_2 = Factory(:user, email: "pickles@smith.com")
    user_2_profile = Factory(:profile, user_id: user_2.id, email: user_2.email)
    subject { Permission.new(user) }

    it { should_not allow("profiles", "show", user_2_profile.id ) }
    it { should_not allow("profiles", "new", user_2_profile.id) }
    it { should_not allow("profiles", "create", user_2_profile.id) }
    it { should_not allow("profiles", "edit", user_2_profile.id) }
    it { should_not allow("profiles", "update", user_2_profile.id) }
    it { should_not allow("profiles", "destroy", user_2_profile.id) }
    it { should_not allow("profiles", "index", user_2_profile.id) }
  end

end
