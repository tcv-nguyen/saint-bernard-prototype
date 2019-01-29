FactoryBot.define do
  factory :patient do
    association :facility

    first_name  { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name   { Faker::Name.last_name }
    mr          { Faker::Number.leading_zero_number(5) }
    dob         { Faker::Date.birthday(18, 65) }
    gender      { TermDefinitions::GENDERS.sample }

    transient do
      allergy_count { 1 }
      chronic_condition_count { 1 }
      medication_count { 1 }
      diagnostic_procedure_count { 1 }
      diagnosis_count { 1 }
      treatment_count { 1 }
    end

    trait :with_admission do
      after(:create) do |patient, evaluator|
        create(:admission, patient: patient)
      end
    end

    trait :with_admission_full_info do
      after(:create) do |patient, evaluator|
        create(:admission, :with_full_info, patient: patient)
      end
    end

    trait :with_allergies do
      after(:create) do |patient, evaluator|
        create_list(:allergy, evaluator.allergy_count, patient: patient)
      end
    end

    trait :with_chronic_conditions do
      after(:create) do |patient, evaluator|
        create_list(:diagnosis, evaluator.chronic_condition_count, diagnosable: patient)
      end
    end

    trait :with_medications do
      after(:create) do |patient, evaluator|
        create_list(:medication_order, evaluator.medication_count, patient: patient)
      end
    end

    trait :with_diagnostic_procedures do
      after(:create) do |patient, evaluator|
        create_list(:diagnostic_procedure, evaluator.diagnostic_procedure_count, patient: patient)
      end
    end

    trait :with_diagnoses do
      after(:create) do |patient, evaluator|
        create_list(:diagnosis, evaluator.diagnosis_count, patient: patient)
      end
    end

    trait :with_treatments do
      after(:create) do |patient, evaluator|
        create_list(:treatment, evaluator.treatment_count, patient: patient)
      end
    end

    trait :with_full_info do
      with_admission_full_info
      with_allergies
      with_chronic_conditions
      with_medications
      with_diagnostic_procedures
      with_diagnoses
      with_treatments
    end
  end
end
