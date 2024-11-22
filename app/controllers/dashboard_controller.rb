class DashboardController < ApplicationController
  def index
    # @upcoming_bookings = Booking.where()
    @user = current_user

    @accepted_rentals = @user.rentals.where(status: "accepted")
    @pending_rentals = @user.rentals.where(status: "pending")
    @declined_rentals = @user.rentals.where(status: "declined")

    @confirmed_requests = Rental.joins(:activity).where(activities: {user_id: @user.id}).where(status: "accepted")
    @pending_requests = @user.requests.where(status: "pending")
    @new_activity = Activity.new
    @new_activity.user = current_user
  end
  # @upcoming_bookings.where(status: "pending").where.not(id: @user)
end
