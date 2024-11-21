class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @users = User.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
    end

    if params[:gender].present?
      @users = User.where(gender: params[:gender])
    end
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities
    @rental = Rental.new
  end
end
