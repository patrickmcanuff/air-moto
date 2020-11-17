class UsersController < ApplicationController
  def show
  end

  def show_motorcycle
    @motorcycle.where(current_user.id == :id)
  end
end
