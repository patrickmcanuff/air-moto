class UsersController < ApplicationController
  def show
    @booking_pending = Booking.joins(:motorcycle).where(motorcycles: { user: current_user}, booked: 'pending')
    @booking_accepted = Booking.where(user: current_user.id, booked: 'accepted')
  end

  def show_motorcycle
    @motorcycles_user = Motorcycle.where(user: current_user.id)
  end

  def booked_decision
    booking_to_change = Booking.find(params[:booking_id])
    if params[:decision] == 'accepted'
      booking_to_change.booked = 'accepted'
      booking_to_change.save
      redirect_to user_show_path(current_user)
    elsif params[:decision] == 'refused'
      booking_to_change.booked = 'refused'
      booking_to_change.save
    end
  end

  def user_params
    params.require(:user).permit(:name, :drivers_license_number, :address, :avatar)
  end
end
