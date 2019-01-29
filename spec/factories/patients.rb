FactoryBot.define do
  factory :patient do
    association :facility

    first_name  { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name   { Faker::Name.last_name }
    mr          { Faker::Number.leading_zero_number(5) }
    dob         { Faker::Date.birthday(18, 65) }
    gender      { TermDefinitions::GENDERS.sample }
  end
end
