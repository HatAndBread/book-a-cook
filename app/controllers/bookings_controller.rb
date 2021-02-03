class BookingsController < ApplicationController
  def my_bookings
    @bookings = Booking.where(user: current_user).order(created_at: :ASC)
    authorize @bookings
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.course = @course
    authorize @booking
    if @booking.save
      redirect_to my_bookings_path
    else
      render "courses/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:attendees, :start_time, :end_time, :address, :course_id)
  end
end
