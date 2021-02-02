class ReviewsController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.course = @course
    authorize @review
    if @review.save
      redirect_to course_path(@course)
    else
      render 'courses/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
