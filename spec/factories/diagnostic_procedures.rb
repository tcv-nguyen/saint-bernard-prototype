FactoryBot.define do
  factory :diagnostic_procedure do
    association :patient

    description { Faker::Lorem.paragraph(3) }
    moment      { 3.months.ago }
  end
end
