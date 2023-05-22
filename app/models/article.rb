class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  belongs_to :user   

  validates :title, presence: true, length: {minimum: 1, maximum: 40}
  validates :body, presence: true, length: { minimum: 10, maximum: 10000 }
end
