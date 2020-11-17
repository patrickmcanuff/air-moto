class MotorcyclesController < ApplicationController
  skip_before_action :authenticate_user!
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
