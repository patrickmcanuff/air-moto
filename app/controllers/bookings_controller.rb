class BookingsController < ApplicationController

  def index
    #add the logic if user is the current user then display all the bookings
    #if the motorcycle is booked by someone else I shouldn't be able to book it for same dates
    # @booking = Booking.find()
     @bookings = current_user.bookings
    # end
  end

  def create
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    @booking = Booking.new(booking_params)
    @booking.motorcycle = @motorcycle
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render 'motorcycles/show'
    end
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end
