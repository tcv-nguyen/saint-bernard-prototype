FactoryBot.define do
  factory :medication_order do
    association :patient
    association :frequency, factory: :order_frequency

    name  { Faker::Lorem.word.titleize }
    unit  { TermDefinitions::MASS_UNITS.sample }
    dosage  { Faker::Number.number(3) }
    route { TermDefinitions::MEDICATION_ROUTES.sample }
    necessity { Faker::Lorem.words(3).join(' ') }
  end
end
