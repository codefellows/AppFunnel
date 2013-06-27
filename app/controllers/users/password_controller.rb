class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation) #, :provider, :uid, :github_username
  end
  private :resource_params
end
