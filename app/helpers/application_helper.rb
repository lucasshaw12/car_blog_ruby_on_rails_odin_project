# frozen_string_literal: true

module ApplicationHelper
  # For comment notification indicator colour
  def read_unread_style
    @unread.count.zero? ? 'read' : 'unread'
  end
end
