class BookingsController < ApplicationController
  def my_bookings
    @bookings = Booking.where(user: current_user).order(start_time: :ASC)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @booking

    if @booking.save
      redirect_to my_bookings_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.permit(:booking).require(:attendees, :start_time, :end_time, :location)
  end
end
