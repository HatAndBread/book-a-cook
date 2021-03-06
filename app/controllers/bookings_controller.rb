class BookingsController < ApplicationController
  def my_bookings
    @user = current_user
    @bookings = Booking.where(user: current_user).order(created_at: :ASC)
    authorize @bookings
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
    @review = Review.new
    @booking.user = current_user
    @booking.course = @course
    authorize @booking
    if @booking.save
      redirect_to my_bookings_path
    else
      respond_to do |f|
        f.html { render "courses/show" }
        f.js
      end
    end
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.status = 'approved'
    @booking.update(booking_params)

    redirect_to my_courses_path
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:attendees, :start_time, :end_time, :address, :course_id, :status)
  end
end


