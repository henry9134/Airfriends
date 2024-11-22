class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :edit, :update]

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

  def edit
    @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to dashboard_path
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities
    @rental = Rental.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender, :location, :photo, :description)
  end
end
