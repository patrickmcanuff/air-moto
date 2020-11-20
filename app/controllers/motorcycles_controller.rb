class MotorcyclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show, :index]

  def index
    if params[:query].present?
      @motorcycles = Motorcycle.search_by_location(params[:query])
    else
      @motorcycles = Motorcycle.all
    end
  end

  def edit
    @motorcycle = Motorcycle.find(params[:id])
  end

  def new
    @motorcycle = Motorcycle.new
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
    @booking = Booking.new
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)
    @motorcycle.user = current_user
    if @motorcycle.save
      redirect_to motorcycle_path(@motorcycle)
    else
      render :new
    end
  end

  def update
    motorcycle = Motorcycle.find(params[:id])
    motorcycle.update(motorcycle_params)
    redirect_to motorcycle_path(motorcycle)
  end

  def destroy
    motorcycle = Motorcycle.find(params[:id])
    if current_user == motorcycle.user
      motorcycle.destroy
      redirect_to show_motorcycle_user_path(current_user)
    else
      render(
          html: "<script>alert('You can't delete this motorcycle post because you are not the owner')</script>".html_safe,
          layout: 'application'
      )
    end
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:model, :year, :location, :brand, photos: [])
  end
end