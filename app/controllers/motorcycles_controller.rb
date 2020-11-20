class MotorcyclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show, :index]

  def index
    if params[:query].present?
      # @motorcycles = Motorcycle.search_by_location(params[:query])
      location = params[:query]
      date_start = params[:date_start][:date_start]
      date_end = params[:date_end][:date_end]
      @motorcycles = Motorcycle.search_by_date(date_start, date_end)
      # @motorcycles = Motorcycle.search_by_location_and_date(:query, :date_start, :date_end)
      # @motorcycles = Motorcycle.search_by_location_and_date(params[:location, :date_start, :date_end])
      # @motorcycles = Motorcycle.search_by_location_and_date(params[:query, :date_start, :date_end])
    else
      @motorcycles = Motorcycle.all
      # render(
      #     html: "<script>alert('Sorry, there are no motorcycles available at this time :(')</script>".html_safe,
      #     layout: 'application'
      # )
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

  def live_user_booking
    @booking = Booking.joins(:motorcycle).where(motorcycles: { user: current_user })
    render json: { bookings: @booking }
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:model, :year, :location, :brand, :price, photos: [])
  end
end
