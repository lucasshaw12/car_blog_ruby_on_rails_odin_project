module ApplicationHelper

  # For comment notification indicator colour
  def read_unread_style
    @unread.count == 0 ? 'read' : 'unread'
  end
end
