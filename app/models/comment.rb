class Comment < ApplicationRecord
  # include Visible

  belongs_to :article
  belongs_to :user
  has_rich_text :body
end
