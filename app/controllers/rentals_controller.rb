class RentalsController < ApplicationController


  def create
    @user = current_user
    @rental = Rental.new(rental_params)
    @rental.user = @user

    if @rental.save
      redirect_to dashboard_path, notice: 'Rental successfully created.'
    else
      raise
      render :new
    end

  end

  private

  def rental_params
    params.require(:rental).permit(:date, :activity_id, :status, :user_id)
  end

end
