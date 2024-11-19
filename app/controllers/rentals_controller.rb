class RentalsController < ApplicationController

  def index
    @rental = Rental.all
  end

  def New
    @user = User.find(params[:id])
    @rental = Rental.new
  end

  def create
    @user = current_user
    @rental = Rental.new(rental_params)
    @rental.user = @user

    if @rental.save
      redirect_to @rental, notice: 'Rental successfully created.'
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:booking_date, :activity_id, :status)
  end

end
