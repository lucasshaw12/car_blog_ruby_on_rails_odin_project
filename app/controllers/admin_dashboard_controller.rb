class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user_access

  def index
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
