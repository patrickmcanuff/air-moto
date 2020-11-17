class MotorcyclesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end
end
