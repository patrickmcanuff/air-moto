class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    #add the logic if user is the current user then display all the bookings
  end

  def new
    @booking = Booking.new
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
  end

  def create
    booking = Booking.new(booking_params)
    booking.save
    redirect_to bookings_path(booking)
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end
