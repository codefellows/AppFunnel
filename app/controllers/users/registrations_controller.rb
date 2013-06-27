class Users::RegistrationsController < Devise::RegistrationsController
  def resource_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)#, :provider, :uid, :github_username
  end
  private :resource_params
end
