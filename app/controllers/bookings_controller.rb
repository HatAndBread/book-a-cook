class BookingsController < ApplicationController
  def my_bookings
    @bookings = Booking.where(user: current_user).order(start_time: :ASC)
    authorize @bookings
  end

  def new
    @course = Course.find(params[:course_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.course = @course
    @booking.status = false
    authorize @booking
    if @booking.save
      redirect_to my_bookings_path
    else
      @booking.save!
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:attendees, :start_time, :end_time, :location)
  end
end
