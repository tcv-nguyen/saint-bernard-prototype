FactoryBot.define do
  factory :diagnostic_procedure do
    association :patient

    description { Faker::Lorem.words(3).join(' ') }
    moment      { 3.months.ago }
  end
end
