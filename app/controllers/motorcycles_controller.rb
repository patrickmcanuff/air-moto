class MotorcyclesController < ApplicationController
  def destroy
    motorcycle = @motorcycle.find(params[:id])
    if current_user == motorcycle.user
      motorcycle.destroy(params[:id])
      redirect_to motorcycles_path
    else
      render(
        html: "<script>alert('You can't delete this motorcycle post because you are not the owner')</script>".html_safe,
        layout: 'application'
      )
    end
  end
end
