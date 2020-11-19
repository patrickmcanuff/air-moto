class UsersController < ApplicationController
  def show
    @booking = Booking.where(user: current_user.id)
  end

  def show_motorcycle
    @motorcycles_user = Motorcycle.where(user: current_user.id)
  end

  def booked_decision
    if params[:decision] == 'accepted'
      booking_to_change = Booking.where(params[:booking_id])
      booking_to_change.booked = 'accepted'
    elsif params[:decision] == 'refused'
      booking_to_change = Booking.where(params[:booking_id])
      booking_to_change.booked = 'refused'
    end
  end
end
