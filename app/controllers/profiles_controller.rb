class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_profile, only: [:show, :edit, :update, :destroy]
  before_filter :reroute_new_users, except: [:create]
  before_filter :authorize

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    
  if params[:commit] == "Save" && @profile.save(validate: false)
      flash[:notice] = "Your application has been saved."
      render action: "edit"
    elsif @profile.save
      @profile.apn.submitted = true
      @profile.apn.save
      flash[:notice] = "Your application has been submitted."
      redirect_to @profile
    else
      flash[:alert] = "Your application hasn't been created."
      render action: "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:commit] == "Save"
        @profile.attributes = profile_params
        if @profile.save(validate: false)
          flash[:notice] = "Your application has been saved."
        else
          flash[:notice] = "Your application hasn't been saved."
        end
        render action: "edit"
    elsif @profile.update_attributes(profile_params)
      @profile.apn.submitted = true
      @profile.apn.save
      flash[:notice] = "Your application has been submitted."
      redirect_to @profile
    else
      flash[:alert] = "Your application hasn't been submitted."
      render action: "edit"
    end
  end

  def destroy
    @profile.destroy
    flash[:notice] = "Your application has been deleted!"
    redirect_to root_path
  end

  private

    def current_permission
      @current_permission ||= Permission.new(current_user)
    end

    def authorize
      if @profile && !current_permission.allow?(params[:controller], params[:action], @profile.user_id)
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
        :first_name, :last_name, :email, :phone_number, :city, :state, :gender, :github, :twitter, :linkedin,
        apn_attributes:[:why, :diligent, :cssfloat, :best, :employment, :findout, :gplus, :skype, :experience, :recommendation])
    end

    def find_profile
      if current_user.admin
          redirect_to reviews_path
      end

      @profile = Profile.find_by_user_id(current_user)
    end

end

