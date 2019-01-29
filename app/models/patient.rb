class Patient < ApplicationRecord
  belongs_to :facility
  has_one :admission, dependent: :destroy
  has_many :allergies, dependent: :destroy
  has_many :chronic_conditions, as: :diagnosable, class_name: 'Diagnosis', dependent: :destroy
  has_many :medications, class_name: 'MedicationOrder', dependent: :destroy
  has_many :diagnostic_procedures, dependent: :destroy
  # The other route is to create Patient has_many :patient_diagnoses (PatientDiagnosis has_many :diagnoses, as: :diagnosable)
  # and use delegate :diagnoses, to: :patient_diagnoses
  has_many :diagnoses, dependent: :destroy
  has_many :treatments, dependent: :destroy
  
  validates :gender, inclusion: { in: GENDERS }, allow_blank: true
end
