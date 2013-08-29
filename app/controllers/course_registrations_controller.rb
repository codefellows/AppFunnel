class CourseRegistrationsController < ApplicationController
  before_filter :authorize_admin
  before_filter :find_course_registration, only: [:show, :edit, :update, :destroy]
  def update
    if @course_registration.update_attributes(course_registration_params)
      flash[ :notice] = "Registration has been updated."
      respond_to do |format|
        format.html { redirect_to reviews_url }
        format.js
      end
    else flash[ :alert] = "Registration has not been updated."
      render :action => "edit"
    end
  end


  private

  def find_course_registration
    @course_registration = CourseRegistration.find(params[:id])
  end

  def authorize_admin
    unless current_user.admin
      redirect_to root_path
    end
  end

  def course_registration_params
    params.require(:course_registration).permit(:id, :decision, :apn_id, :course_id)
  end

end
