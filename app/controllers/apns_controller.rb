class ApnsController < ApplicationController
  before_filter :find_profile
  before_filter :find_apn, only: [:show, :edit, :update, :destroy]

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
    excluded_attributes = ["id", "applicant_id", "created_at", "updated_at"]
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
    redirect_to profiles_path
  end

  private
    # def apn_params
    #   params.require(:apn).permit(
    #     :best, :cssfloat, :diligent,
    #     :employment, :findout, :gplus, :skype, :why)
    # end
    def apn_params

      # params.require(:apn).permit!
      params.require(:apn).permit(
        :why, :diligent, :cssfloat, :best, :employment, :findout, :gplus, :skype)
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
      redirect_to '/'
    end

end
