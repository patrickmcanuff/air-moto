class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def show_motorcycle
    @motorcycles_user = Motorcycle.where(user: current_user.id)
  end
end
