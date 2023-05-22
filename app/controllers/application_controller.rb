class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :set_notifications, if: :current_user
	skip_before_action :authenticate_user!, only: [:index, :show]

	private
	def set_notifications
		notifications = Notification.where(recipient: current_user).newest_first.limit(9).unread
		@unread = notifications.unread	
		@read = notifications.read
	end
end
