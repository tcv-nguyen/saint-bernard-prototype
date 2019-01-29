FactoryBot.define do
  factory :symptom do
    association :admission
    description { Faker::Lorem.paragraph(3) }
  end
end
