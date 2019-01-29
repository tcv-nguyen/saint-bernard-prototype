FactoryBot.define do
  factory :allergy do
    association :patient

    description { Faker::Lorem.paragraph(3) }
  end
end
