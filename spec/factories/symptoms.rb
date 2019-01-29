FactoryBot.define do
  factory :symptom do
    association :admission
    description { Faker::Lorem.words(3).join(' ') }
  end
end
