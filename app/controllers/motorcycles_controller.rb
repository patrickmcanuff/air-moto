class MotorcyclesController < ApplicationController
    def index
      @motorcycles = Motorcycle.all
    end

    def new
        @motorcycle = Motorcycle.new
    end

end
