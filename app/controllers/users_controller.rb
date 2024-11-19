class UsersController < ApplicationController

  def index
    if params[:query].present?
      @users = User.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
    end
  end



  def show
    @user = User.find(params[:id])
    @activities = @user.activities
  end
end
