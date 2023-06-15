class ApplicationController < ActionController::Base
  # Set basic http auth before anyone can access the application
  # http_basic_authenticate_with name: 'dhh', password: 'secret', except: %i[index show]

  # Ensure a user is logged in before having access
  # unless, its the article index and show views
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :set_notifications, if: :current_user
  before_action :set_query

  # Allows Ransack search form to render on all views,
  # otherwise, will only render on views/search/index.html.erb
  def set_query
    @q = Article.ransack(params[:q])
  end

  # All private methods ensure only the class they're initialized in can access the method
  private

  # Return all notifications for the current_user using 'where'
  # which is an ActiveRecord::Relation object
  # Set unread and read instance variables
  def set_notifications
    notifications = Notification.where(recipient: current_user).newest_first.limit(9).unread
    @unread = notifications.unread
    @read = notifications.read
  end
end
