class ReviewsController < ApplicationController
  before_filter :authorize_admin
  before_filter :find_apn, only: [:create, :edit, :update, :destroy]

  def index
    @reviews = Review.all
    @review_count = Review.count
    @unreviewed_count = Apn.where('"reviewed" = ?', false).count
  end

  def show
    @review = Review.find(params[:id])

    @apn_display_attributes = @review.apn.attributes
    excluded_attributes = ["profile_id", "id", "applicant_id", "created_at", "updated_at"]
    @apn_display_attributes.delete_if {|key| excluded_attributes.include? key }

  end

  def new
    @review = Review.new
    @apn = Apn.where('"reviewed" = ?', false).order("created_at").first
    @apn_display_attributes = @apn.attributes
    excluded_attributes = ["profile_id", "id", "applicant_id", "created_at", "updated_at"]
    @apn_display_attributes.delete_if {|key| excluded_attributes.include? key }
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])

    @apn_display_attributes = @review.apn.attributes
    excluded_attributes = ["profile_id", "id", "applicant_id", "created_at", "updated_at"]
    @apn_display_attributes.delete_if {|key| excluded_attributes.include? key }

  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    if @review.save && @apn.update_attributes(reviewed: true)
      link = reviews_path
      name = @apn.profile.first_name.capitalize + " ".to_s + @apn.profile.last_name.capitalize
      redirect_to new_review_path, notice: "#{name} successfully reviewed. New application loaded. If you're feeling lazy, <a href='#{link}'>go to the Dashboard</a>".html_safe
    else
      render action: "new", alert: "something went wrong with submitting the review"
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(review_params)
        format.html { redirect_to @review, notice: "Review was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

  end

  private

    def find_apn
      @apn = Apn.find(review_params[:apn_id])
    end

    def authorize_admin
      unless current_user.admin
        redirect_to root_path
      end
    end

    def review_params
      params.require(:review).permit(:apn_id, :contribution, :education,
        :exceptional, :fit, :note, :resume, :user_id, :work_experience)
    end
end
