# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {minimum: 1, maximum: 40}
  validates :body, presence: true, length: {minimum: 10, maximum: 10_000}

  has_noticed_notifications model_name: "Notification"

  # `ransackable_attributes` by default returns all column names
  # and any defined ransackers as an array of strings.
  # For overriding with a whitelist array of strings.
  def self.ransackable_attributes(_auth_object=nil)
    column_names + _ransackers.keys
  end

  # `ransackable_associations` by default returns the names
  # of all associations as an array of strings.
  # For overriding with a whitelist array of strings.
  def self.ransackable_associations(_auth_object=nil)
    reflect_on_all_associations.map {|a| a.name.to_s }
  end
end
