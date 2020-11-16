class MotorcyclesController < ApplicationController
  def home
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end
end
