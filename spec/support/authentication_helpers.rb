module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/users/sign_in'
    within "#login" do
      fill_in "Email", :with => user.email
      fill_in "Password", :with => "password"
      click_button 'Log In'
    end
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, :type => :request
end
