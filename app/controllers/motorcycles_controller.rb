class MotorcyclesController < ApplicationController
   skip_before_action :authenticate_user!
  
    def index
      @motorcycles = Motorcycle.all
    end

    def show
        @motorcycle = Motorcycle.find(params[:id])
      end

    def edit
        @motorcycle = Motorcycle.find(params[:id])
      end
    
    

    def new
        @motorcycle = Motorcycle.new
    end

    def create
        @motorcycle = Motorcycle.new(motorcycle_params)
        if @motorcycle.save
          redirect_to motorcycles_path
        else
          render :new
        end
    end
 
    private

    def motorcycle_params
        params.require(:motorcycle).permit(:model, :year, :location, :brand)
    end


end
