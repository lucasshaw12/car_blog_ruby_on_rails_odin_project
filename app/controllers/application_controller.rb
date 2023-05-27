class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :set_notifications, if: :current_user
	before_action :set_query 
	skip_before_action :authenticate_user!, only: [:index, :show]

	# Allows Ransack search form to render on all views,
	# otherwise, will only render on search/index
	def set_query
		@q = Article.ransack(params[:q])
	end

	private

	def set_notifications
		notifications = Notification.where(recipient: current_user).newest_first.limit(9).unread
		@unread = notifications.unread	
		@read = notifications.read
	end
end
