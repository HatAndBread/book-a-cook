class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @courses = policy_scope(Course).order(created_at: :desc)
    authorize @courses
    @search = params["search"]
    if params[:categories].present?
      @courses = Course.tagged_with(params[:categories])
    end
  end

  def show
    @course = Course.find(params[:id])
    puts "*******************************************************************"
    p @course.photos.attached?
    puts "*******************************************************************"
    authorize @course
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :price, :user, category_list: [], ingredient_list: [])
  end
end
