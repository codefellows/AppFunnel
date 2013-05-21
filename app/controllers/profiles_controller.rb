class ProfilesController < ApplicationController

  def index
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    if @profile.save
      flash[:notice] = "Your profile has been created."
      redirect_to @profile
    else
      flash[:alert] = "Your profile hasn't been created."
      render action: "new"
    end
  end

  def show
  end

  private
    def profile_params
      params.require(:profile).permit(
        :first_name, :last_name, :email,
        :phone_number, :city, :state, :gender )
    end

end
