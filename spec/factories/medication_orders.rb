FactoryBot.define do
  factory :medication_order do
    association :frequency, factory: :order_frequency

    name  { Faker::Lorem.word }
    unit  { TermDefinitions::MASS_UNITS.sample }
    dosage  { Faker::Number.decimal(2, 2) }
    route { TermDefinitions::MEDICATION_ROUTES.sample }
  end
end
