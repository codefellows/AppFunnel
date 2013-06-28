class OmniauthCallbacksController < ApplicationController
  def github
     user = User.find_for_oauth(request.env["omniauth.auth"])

     if user.persisted?
       flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Github"
       sign_in_and_redirect user, :event => :authentication
     else
       session["devise.github_data"] = request.env["omniauth.auth"]
       redirect_to new_user_registration_url
     end
   end

   # def resource_params
   #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :provider, :uid, :github_username)
   # end
   # private :resource_params
end
