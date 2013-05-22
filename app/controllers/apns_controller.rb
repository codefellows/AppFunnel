class ApnsController < ApplicationController
  before_filter :find_apn, only: [:show, :edit, :update, :destroy]

  def new
    @apn = Apn.new
  end

  def create
    @apn = Apn.create(apn_params)
    if @apn.save
      flash[:notice] = "Application submitted."
      redirect_to @apn
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

  private
    def apn_params
      params.require(:apn).permit(
        :applicant_id, :best, :cssfloat, :diligent,
        :employment, :findout, :gplus, :skype, :why)
    end

    def find_apn
      @apn = Apn.find(params[:id])
    end

end
