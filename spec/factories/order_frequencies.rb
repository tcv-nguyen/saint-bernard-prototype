FactoryBot.define do
  factory :order_frequency do
    value { "q#{Faker::Number.number(1)}" }
    unit  { TermDefinitions::FREQUENCY_UNITS.sample }
  end
end
