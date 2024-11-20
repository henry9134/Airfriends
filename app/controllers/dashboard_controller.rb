class DashboardController < ApplicationController
  def index
    # @upcoming_bookings = Booking.where()
    @user = current_user
    @upcoming_bookings = @user.rentals.where("booking_date >= ?", Date.today)


    @hosted_rentals = Rental.joins(:activity).where(activities: {user_id: @user.id}).where("booking_date >= ?", Date.today)
  end
end
