class ReviewsController < ApplicationController
  before_filter :authorize_admin
  before_filter :find_review, only: [:show, :edit, :update, :destroy]
  before_filter :find_apn, only: [:create, :update]
  before_filter :find_apn_w_rev_id, only: [:edit, :destroy]
  after_filter :calculate_total, only: [:create, :update]

  def index
    @reviews = Review.all
    @review_count = Review.count
    @unreviewed_count = Apn.where('"reviewed" = ?', false).count
    @averages = ["education", "contribution", "resume", "fit", "work_experience", "total"].map do |attr|
      Review.average(attr)
    end
  end

  def show
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
      redirect_to new_review_path, notice: ("#{name} successfully reviewed." +
        " New application loaded. If you're feeling lazy, <a href='#{link}'>" +
        "go to the Dashboard</a>").html_safe
    else
      render action: "new", alert: "something went wrong with submitting the review"
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update_attributes(review_params)
      redirect_to @review, notice: "Review was successfully updated."
    else
      render action: "edit"
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    flash[:notice] = "Review was destroyed"
    redirect_to root_path
  end

  private

    def find_review
      @review = Review.find(params[:id])
    end

    # fixes edit and delete error where apn_id
    # isn't passed in params
    #
    def find_apn_w_rev_id
      @apn = Apn.find(@review.apn_id)
    end

    def find_apn
      @apn = Apn.find(review_params[:apn_id])
    end

    def calculate_total
      @review.total = (@review.education * 3) + (@review.contribution * 5) +
        (@review.resume * 2) + (@review.fit * 2) + (@review.work_experience * 2)
      @review.save
    end

    def authorize_admin
      unless current_user.admin
        redirect_to root_path
      end
    end

    def review_params
      params.require(:review).permit(:id, :apn_id, :contribution, :education,
        :exceptional, :fit, :note, :resume, :user_id, :work_experience)
    end
end
