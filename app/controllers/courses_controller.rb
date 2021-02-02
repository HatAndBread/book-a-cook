class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @courses = policy_scope(Course).order(created_at: :desc)
    authorize @courses
    if params[:categories].present? || params[:ingredients].present?
      @courses = Course.tagged_with([params[:categories], params[:ingredients]])
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @course = Course.find(params[:id])
    @booking.course = @course
    authorize @course
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :price, :user, category_list: [], ingredient_list: [])
  end
end
