class Patient < ApplicationRecord
  belongs_to :facility
  has_one :admission, dependent: :destroy
  has_many :allergies, -> { order(:id) }, dependent: :destroy
  has_many :chronic_conditions, as: :diagnosable, class_name: 'Diagnosis', dependent: :destroy
  has_many :medications, class_name: 'MedicationOrder', dependent: :destroy
  has_many :diagnostic_procedures, dependent: :destroy
  # If we need to keep model Diagnosis consistently as polymorphic
  # probably try to create Patient has_one :patient_diagnosis (PatientDiagnosis has_many :diagnoses, as: :diagnosable)
  # and use delegate :diagnoses, to: :patient_diagnosis
  has_many :diagnoses, dependent: :destroy
  has_many :treatments, dependent: :destroy
  
  validates :gender, inclusion: { in: GENDERS }

  delegate :name, to: :facility, prefix: true
  delegate :date, :time, :diagnoses_described_codes, :symptoms_descriptions, :observations_descriptions, 
           to: :admission, prefix: true

  def full_name
    [first_name, middle_name, last_name].reject(&:blank?).join(' ')
  end

  def age
    now = Time.current.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def allergies_descriptions
    allergies.pluck(:description).to_description
  end

  def chronic_conditions_descriptions
    chronic_conditions.to_a.map(&:described_code).to_string(', ')
  end

  def medications_descriptions
    medications.to_a.map(&:description).to_description
  end

  def diagnostic_procedures_descriptions
    diagnostic_procedures.to_a.map(&:detail).to_string(', ')
  end

  def diagnoses_described_codes
    diagnoses.to_a.map(&:described_code).to_string(', ')
  end

  def treatments_descriptions
    treatments.to_a.map(&:detail).to_string(', ')
  end

  def summary
    "
      <div>
        This #{age} years old #{gender} was admitted to #{facility_name} on #{admission_date}, at #{admission_time} due to 
        #{admission_diagnoses_described_codes}. The observed symptoms on admission were #{admission_symptoms_descriptions}. 
        #{admission_observations_descriptions}.
      </div>
      <div>
        Upon asking about known allergies, the patient disclosed #{allergies_descriptions}. Upon asking about chronic conditions, 
        the patient disclosed #{chronic_conditions_descriptions}. The patient was administered with #{medications_descriptions}.
      </div>
      <div>
        The staff performed #{diagnostic_procedures_descriptions}, revealing #{diagnoses_described_codes}. Our team proceeded to 
        #{treatments_descriptions}.
      </div>
    ".squish
  end
end
