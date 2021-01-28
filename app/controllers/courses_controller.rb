class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @courses = policy_scope(Course).order(created_at: :desc)
    authorize @courses
  end

  def show
    @course = Course.find(params[:id])
    puts "*******************************************************************"
    p @course.photos.attached?
    puts "*******************************************************************"
    authorize @course
  end
end
