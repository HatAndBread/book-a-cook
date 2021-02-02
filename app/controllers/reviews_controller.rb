class ReviewsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.course = @course
    if @review.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :course_id, :user_id)
  end
end
