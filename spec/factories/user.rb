# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { "password" }
    created_at { Time.new(2024) }
    updated_at { Time.new(2024) }
    confirmed_at { Time.now }
  end
end