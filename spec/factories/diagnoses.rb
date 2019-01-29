FactoryBot.define do
  factory :diagnosis do
    coding_system { "#{('A'..'Z').to_a.sample}#{Faker::Number.number(3)}" }
    code          { Faker::Number.number(3) }
    description   { Faker::Lorem.words(3).join(' ') }
  end
end
