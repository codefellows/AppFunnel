class CoursesController < ApplicationController
  before_filter :find_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[ :notice] = "Class has been created."
      redirect_to @course
    else
      flash[ :alert] = "Class has not been created."
      render :action => "new"
    end
  end

  def edit

  end
  def show

  end

  def update
    if @course.update_attributes(course_params)
      flash[ :notice] = "Class has been updated."
      redirect_to @course
    else flash[ :alert] = "Class has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @course.destroy
    flash[:notice] = "Class has been deleted."
    redirect_to courses_path
  end

  private
  def course_params
      params.require(:course).permit(:id, :name, :description, :desc_url,
        :start_date, :end_date, :cost, :course_type)
    end

  def find_course
    @course = Course.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The class you were " +
                      "looking for could not be found."
    redirect_to root_path
  end
end
