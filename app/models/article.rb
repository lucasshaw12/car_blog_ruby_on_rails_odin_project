class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 1, maximum: 40 }
  validates :body, presence: true, length: { minimum: 10, maximum: 10_000 }

  has_noticed_notifications model_name: 'Notification'

  def self.ransackable_attributes(_auth_object = nil)
    ['title']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['user']
  end
end
