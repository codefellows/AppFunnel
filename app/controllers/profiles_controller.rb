class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_profile, only: [:show, :edit, :update, :destroy]
<<<<<<< HEAD
=======
  before_filter :reroute_new_users, except: [:create]
  before_filter :authorize
>>>>>>> auth

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    if @profile.save
      flash[:notice] = "Your profile has been created."
      redirect_to @profile
    else
      flash[:alert] = "Your profile hasn't been created."
      render action: "new"
    end
  end

  def show
    @display_attributes = @profile.attributes
    excluded_attributes = ["user_id", "id", "created_at", "updated_at"]
    @display_attributes.delete_if {|key| excluded_attributes.include? key }
  end

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to @profile
    else
      flash[:alert] = "Your profile hasn't been updated."
      render action: "edit"
    end
  end

  def destroy
    @profile.destroy
    flash[:notice] = "Your profile has been deleted!"
    redirect_to root_path
  end

  private

    def current_permission
      @current_permission ||= Permission.new(current_user)
    end

    def authorize
      if !current_permission.allow?(params[:controller], params[:action])
        redirect_to root_url, alert: "not authorized"
      end
    end

    def reroute_new_users
      unless @profile
        @profile = Profile.new
        render action: "new"
      end
    end

    def profile_params
      params.require(:profile).permit(
        :first_name, :last_name, :email,
        :phone_number, :city, :state, :gender )
    end

    def find_profile
      @profile = Profile.find_by_user_id(current_user)
    end
end

