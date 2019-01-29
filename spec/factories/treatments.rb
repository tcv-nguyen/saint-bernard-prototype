FactoryBot.define do
  factory :treatment do
    association :patient

    description { Faker::Lorem.paragraph(3) }
    necessity   { Faker::Lorem.paragraph(3) }
  end
end
