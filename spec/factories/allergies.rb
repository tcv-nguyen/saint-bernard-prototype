FactoryBot.define do
  factory :allergy do
    association :patient

    description { Faker::Lorem.words(3).join(' ') }
  end
end
