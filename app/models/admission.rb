class Admission < ApplicationRecord
  belongs_to :patient
  has_many :diagnoses, as: :diagnosable, class_name: 'Diagnosis', dependent: :destroy
  has_many :symptoms, dependent: :destroy
  has_many :observations, dependent: :destroy
end
