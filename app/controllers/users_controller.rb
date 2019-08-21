class UsersController < ApplicationController
  # This creates the dashboard for the user to see their bookings
  # The dashboard.html.erb still has to be styled
  def dashboard
    @user = current_user
    @cuties = Cutie.where(user: @user.id)
  end
end
