class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
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

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end
