class Comment < ApplicationRecord
  # include Visible

  belongs_to :article
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
      CommentNotification.with(comment: self, article: article).deliver_later(article.user)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end


end
