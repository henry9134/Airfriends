class DashboardController < ApplicationController
  def index
    # @upcoming_bookings = Booking.where()
    @user = current_user
    @upcoming_bookings = @user.rentals.where("booking_date >= ?", Date.today)
    @confirmed_requests = @user.rentals.where(status: "accepted")
    @hosted_rentals = Rental.joins(:activity).where(activities: {user_id: @user.id}).where("booking_date >= ?", Date.today).where(status: "accepted")
    @pending_requests = @user.requests.where(status: "pending")
  end
  # @upcoming_bookings.where(status: "pending").where.not(id: @user)
end
