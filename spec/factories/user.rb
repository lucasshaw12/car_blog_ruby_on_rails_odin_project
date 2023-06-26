# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    factory :guest do
      email { Faker::Internet.email }
      password { 'password' }
      password_confirmation { "password" }
      created_at { Time.new(2024) }
      updated_at { Time.new(2024) }
      confirmed_at { Time.now }
      role { 0 } # User: guest
    end

    factory :basic do
      email { Faker::Internet.email }
      password { 'password' }
      password_confirmation { "password" }
      created_at { Time.new(2024) }
      updated_at { Time.new(2024) }
      confirmed_at { Time.now }
      role { 1 } # User: basic
    end

    factory :admin do
      email { Faker::Internet.email }
      password { 'password' }
      password_confirmation { "password" }
      created_at { Time.new(2024) }
      updated_at { Time.new(2024) }
      confirmed_at { Time.now }
      role { 2 } # User: admin
    end
  end
end
