FactoryBot.define do
  factory :admission do
    association :patient
    moment  { 1.month.ago }

    transient do
      diagnoses_count { 1 }
      symptoms_count  { 1 }
      observations_count  { 1 }
    end

    trait :with_diagnoses do
      after(:create) do |admission, evaluator|
        create_list(:diagnosis, evaluator.diagnoses_count, diagnosable: admission)
      end
    end

    trait :with_symptoms do
      after(:create) do |admission, evaluator|
        create_list(:symptom, evaluator.symptoms_count, admission: admission)
      end
    end

    trait :with_observations do
      after(:create) do |admission, evaluator|
        create_list(:observation, evaluator.observations_count, admission: admission)
      end
    end

    trait :with_full_info do
      with_diagnoses
      with_symptoms
      with_observations
    end
  end
end
