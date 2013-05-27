class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  private
    def review_params
      params.require(:apn).permit(
        :awesome, :work, :programming)
    end

    def find_review
      @review = Review.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Record not found"
      redirect_to reviews_path
    end

end
