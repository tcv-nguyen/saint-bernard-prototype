FactoryBot.define do
  factory :diagnosis do
    coding_system { Faker::Lorem.word }
    code          { Faker::Lorem.word }
    description   { Faker::Lorem.paragraph(3) }
  end
end
