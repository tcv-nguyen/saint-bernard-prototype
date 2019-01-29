FactoryBot.define do
  factory :treatment do
    association :patient

    description { Faker::Lorem.words(3).join(' ') }
    necessity   { Faker::Lorem.words(3).join(' ') }
  end
end
