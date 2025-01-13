FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraphs }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    user factory: :user
    article factory: :article
  end
end
