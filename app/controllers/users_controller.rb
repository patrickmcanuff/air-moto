class UsersController < ApplicationController
  def show
    @booking = Booking.where(user: current_user.id)
  end

  def show_motorcycle
    @motorcycles_user = Motorcycle.where(user: current_user.id)
  end

  def booked_decision
    booking_to_change = Booking.find(params[:booking_id])
    if params[:decision] == 'accepted'
      booking_to_change.booked = 'accepted'
      booking_to_change.save
    elsif params[:decision] == 'refused'
      booking_to_change.booked = 'refused'
      booking_to_change.save
    end
  end
end
