class ReviewsController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @review = Review.new(review_params)
    @booking = Booking.new
    @review.user = current_user
    @review.course = @course
    authorize @review
    if @review.save
      redirect_to course_path(@course, anchor: "review-#{@review.id}")
    else
      respond_to do |f|
        f.html { render "courses/show" }
        f.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
