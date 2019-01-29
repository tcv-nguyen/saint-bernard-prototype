FactoryBot.define do
  factory :admission do
    association :patient
    moment  { 1.month.ago }

    transient do
      diagnoses_count { 1 }
    end

    trait :with_diagnoses do
      after(:create) do |admission, evaluator|
        create_list(:diagnosis, evaluator.diagnoses_count, diagnosable: admission)
      end
    end
  end
end
