class UsersController < ApplicationController

  def index
    @users = User.all
    @users_loc = User.where("location ILIKE ?", "%#{params[:query]}%")
  end
end
