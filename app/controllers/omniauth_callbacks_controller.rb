class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in user
      redirect_to root_path
    else
      redirect_to new_user_registration_url
    end
  end

  alias_method :github, :all
  alias_method :linkedin, :all

end
