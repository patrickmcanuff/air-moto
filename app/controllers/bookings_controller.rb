class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      redirect_to booking_path(booking)
    else
      render :new
    end
  end

  def booking_params
    # params.require(:booking).permit(:)
  end
end
