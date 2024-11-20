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

  def update
    @request_to_confirm = Rental.find(params[:id])

    if @request_to_confirm.update(rental_params)
    redirect_to dashboard_path
    else
    render 'new', status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:booking_date, :activity_id, :status, :user_id)
  end


  end
