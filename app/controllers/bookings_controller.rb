class BookingsController < ApplicationController
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

  def destroy
    booking = Booking.find(params[:id])
    if current_user == booking.user
      booking.destroy
      redirect_to bookings_path
    else
      render(
        html: "<script>alert('You can't delete this booking because you are not the owner of the booking')</script>".html_safe,
        layout: 'application'
      )
    end
  end
end
