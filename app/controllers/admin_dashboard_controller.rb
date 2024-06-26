# frozen_string_literal: true

class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user_access

  def index
    @user = User.includes(:articles, :comments)
  end

  private

  def admin_user_access
    if current_user.role == 'admin'
      render :index
    else
      redirect_to new_user_session_path
    end
  end
end
