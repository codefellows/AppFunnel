class ReviewsController < ApplicationController
  before_filter :authorize_admin
  before_filter :find_review, only: [:show, :edit, :update, :destroy]
  before_filter :find_apn, only: [:create, :update]
  before_filter :find_apn_w_rev_id, only: [:edit, :destroy]
  after_filter :send_email, only: [:create, :update]
  has_scope :decision

  def index
    @reviews = apply_scopes(Review).order(params[:sort]).order(params[:subsort])
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
    if @apn
      @apn_display_attributes = @apn.attributes
      excluded_attributes = ["profile_id", "id", "applicant_id", "created_at", "updated_at"]
      @apn_display_attributes.delete_if {|key| excluded_attributes.include? key }
    else
      flash[:notice] = "All applications have been reviewed!"
      redirect_to reviews_path
    end
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
    @review.exceptional ||= 0
    if @review.save
      @apn.update_attribute(:reviewed, true)
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
      redirect_to edit_review_path(@review), notice: ("Review was successfully updated.")
    else
      render action: "edit"
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    @apn.update_attribute(:reviewed, false)
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

    def authorize_admin
      unless current_user.admin
        redirect_to root_path
      end
    end

    def review_params
      params.require(:review).permit(:id, :apn_id, :contribution, :education,
        :exceptional, :fit, :note, :resume, :user_id, :work_experience, :decision)
    end

    def send_email
      @user = Profile.find(review_params[:user_id])

      if @review.decision == "Request Video"
        UserMailer.video_email(@user).deliver
      end
    end

end
