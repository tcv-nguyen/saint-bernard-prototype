FactoryBot.define do
  factory :observation do
    association :admission

    description { Faker::Lorem.words(3).join(' ').capitalize }
    moment      { 3.months.ago }
  end
end
