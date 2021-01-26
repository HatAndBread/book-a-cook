class BookingsController < ApplicationController
  def my_bookings
    @bookings = Booking.where(user: current_user).order(start_time: :ASC)
  end

  def new
    @course = Course.find(params[:course_id])
    @booking = Booking.new
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.course = @course
    raise
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:attendees, :start_time, :end_time, :location)
  end
end
