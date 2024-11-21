class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @review = Review.new
   
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.reviewer = current_user
    @review.friend = User.find(params[:user_id])
    if @review.save
      redirect_to user_path(User.find(params[:user_id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @user= User.find(params[:user_id])
    redirect_to user_path(@user), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
