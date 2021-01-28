class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @courses = policy_scope(Course).order(created_at: :desc)
    authorize @courses
  end

  def show
    @course = Course.find(params[:id])
    authorize @course
  end
end
