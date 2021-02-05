class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @courses = policy_scope(Course).order(created_at: :desc)
    if params[:categories].present? || params[:ingredients].present?
      @courses = Course.tagged_with([params[:categories], params[:ingredients]])
    end
    authorize @courses
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @course = Course.find(params[:id])
    @booking.course = @course
    authorize @course
  end

  def my_courses
    @user = current_user
    @my_courses = Course.where(user: current_user).order(created_at: :ASC)
    @my_reservations = Booking.where(course_id: @my_courses)
    @my_approved_reservations = @my_reservations.where(status: 'approved')
    @markers = @my_approved_reservations.geocoded.map do |booking|
      {
        lat: booking.latitude,
        lng: booking.longitude
      }
    end
    authorize @my_courses
  end

  def new
    @course = Course.new
    p @course
    authorize @course
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    authorize @course

    puts @course.valid?
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end


  private

  def course_params
    params.require(:course).permit(:title, :description, :price, :user, photos: [], category_list: [], ingredient_list: [])
  end
end
