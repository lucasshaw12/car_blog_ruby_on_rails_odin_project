module ApplicationHelper
	def read_unread_style
		@unread.count == 0 ? "read" : "unread"
	end
end
