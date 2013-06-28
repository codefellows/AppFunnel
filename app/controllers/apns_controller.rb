class ApnsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_profile
  before_filter :find_apn, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  def new
    @apn = @profile.build_apn
  end

  def create
    @apn = @profile.build_apn(apn_params)
    if @apn.save
      flash[:notice] = "Application submitted."
      redirect_to [@profile, @apn]
    else
      flash[:alert] = "Application not submitted"
      render action: "new"
    end
  end

  def show
    @apn_display_attributes = @apn.attributes
    excluded_attributes = ["profile_id", "id", "applicant_id", "created_at", "updated_at"]
    @apn_display_attributes.delete_if {|key| excluded_attributes.include? key }
  end

  def edit
  end

  def update
    if @apn.update_attributes(apn_params)
      flash[:notice] = "Your application has been updated."
      redirect_to [@profile, @apn]
    else
      flash[:alert] = "Your application hasn't been updated."
      render action: "edit"
    end
  end

  def destroy
    @apn.destroy
    flash[:notice] = "Your application has been deleted."
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

    def apn_params
      params.require(:apn).permit(
        :id, :why, :diligent, :cssfloat, :best, :employment, :findout, :gplus, :skype, :video, :code_sample,
        profile_attributes: [:first_name, :last_name, :phone_number, :city, :state, :gender])
    end

    def find_profile
      @profile = Profile.find(params[:profile_id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The profile you were looking for could not be found."
      redirect_to root_path
    end

    def find_apn
      @apn = Apn.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The application you were " +
                      "looking for could not be found."
      redirect_to root_path
    end

end
