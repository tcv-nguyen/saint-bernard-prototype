FactoryBot.define do
  factory :observation do
    association :admission

    description { Faker::Lorem.paragraph(3) }
    moment      { 3.months.ago }
  end
end
