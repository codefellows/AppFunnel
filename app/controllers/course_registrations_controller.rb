class CourseRegistrationsController < ApplicationController
  before_filter :authorize_admin
  before_filter :find_course_registration, only: [:show, :edit, :update, :destroy]
  def update
    if @registration.update_attributes(registration_params)
      flash[ :notice] = "Registration has been updated."
      redirect_to @course
    else flash[ :alert] = "Registration has not been updated."
      render :action => "edit"
    end
  end


  private

  def find_review
    @registration = Registration.find(params[:id])
  end

  def authorize_admin
    unless current_user.admin
      redirect_to root_path
    end
  end

  def registration_params
    params.permit(:id, :decision)
  end

end
