class MotorcyclesController < ApplicationController
   skip_before_action :authenticate_user!
  
    def index
      @motorcycles = Motorcycle.all
    end

    def new
        @motorcycle = Motorcycle.new
    end

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end
end
