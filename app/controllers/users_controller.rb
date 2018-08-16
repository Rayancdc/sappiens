class UsersController < ApplicationController
  layout "dashboard"
  before_action :set_user

  def dashboard
  end

  def my_experiences
    @experiences = Experience.where(company: current_user.company)
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_users_path
    else
      render :edit_profile
    end
  end

  def invite_friends
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :cellphone, :image)
  end
end
