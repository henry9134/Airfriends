class DashboardController < ApplicationController
  def index
    # @upcoming_bookings = Booking.where()
    @user = current_user
    @upcoming_rentals = Rental.where("booking_date >= ?", Date.today)
    # @user_requests =
    # @past_bookings =
  end
end
