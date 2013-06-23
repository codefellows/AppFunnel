require "spec_helper"

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

describe Permission do

  describe "as user with own profiles" do
    user = Factory(:user, email: "this32dkj@email.com")
    profile = Factory(:profile, user_id: user.id )
    @profile = profile
    subject { Permission.new(user) }
    it { should allow("profiles", "show") }
    it { should allow("profiles", "new") }
    it { should allow("profiles", "create") }
    it { should allow("profiles", "edit") }
    it { should allow("profiles", "update") }
    it { should allow("profiles", "destroy") }
    it { should_not allow("profiles", "index") }
  end

  describe "as user with other's profile" do
    user = Factory(:confirmed_user, email: "some@email.com")
    profile = Factory(:profile, user_id: (user.id+1) )
    @profile = profile
    subject { Permission.new(user) }

    it { should_not allow("profiles", "show") }
    it { should_not allow("profiles", "new") }
    it { should_not allow("profiles", "create") }
    it { should_not allow("profiles", "edit") }
    it { should_not allow("profiles", "update") }
    it { should_not allow("profiles", "destroy") }
    it { should_not allow("profiles", "index") }
  end

end
