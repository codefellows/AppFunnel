class ReviewsController < ApplicationController
  before_filter :authorize_admin

  def index
    @reviews = Review.all
    @review_count = Review.count
    @unreviewed_count = Apn.count - @review_count
  end

  def show
    @review = Review.find(params[:id])

    @apn_display_attributes = @review.apn.attributes
    excluded_attributes = ["profile_id", "id", "applicant_id", "created_at", "updated_at"]
    @apn_display_attributes.delete_if {|key| excluded_attributes.include? key }

  end

  def new
    @review = Review.new
    @apn = Apn.where("not reviewed").order("created_at").first

    @apn_display_attributes = @review.apn.attributes
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

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
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

    def authorize_admin
      unless current_user.admin
        redirect_to root_path
      end
    end

    def review_params
      params.require(:review).permit(:apn_id, :contribution, :education, :exceptional, :fit, :note, :resume, :user_id, :work_experience)
    end
end
