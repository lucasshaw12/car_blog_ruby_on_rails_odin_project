# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.words(number: 2) }
    body { Faker::Lorem.paragraphs }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    status { "public" }
    association :user, factory: :user
  end
end
