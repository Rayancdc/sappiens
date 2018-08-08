class UsersController < ApplicationController
  layout "dashboard"
  before_action :set_user

  def dashboard
  end

  def my_experiences
  end

  def edit_profile
  end

  def invite_friends
  end

  private
  def set_user
    @user = current_user
  end
end
