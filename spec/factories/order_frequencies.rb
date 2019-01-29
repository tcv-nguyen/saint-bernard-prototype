FactoryBot.define do
  factory :order_frequency do
    value { Faker::Number.number(1) }
    unit  { TermDefinitions::FREQUENCY_UNITS.sample }
  end
end
