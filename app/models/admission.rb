class Admission < ApplicationRecord
  belongs_to :patient
  has_many :diagnoses, as: :diagnosable, class_name: 'Diagnosis', dependent: :destroy
  has_many :symptoms, -> { order(:id) }, dependent: :destroy
  has_many :observations, dependent: :destroy

  validates :moment, presence: true

  def date
    moment.strftime('%B %d, %Y')
  end

  def time
    moment.strftime('%l:%M %P').squish
  end

  def diagnoses_described_codes
    diagnoses.to_a.map(&:described_code).to_string(', ')
  end

  def symptoms_descriptions
    symptoms.pluck(:description).to_description
  end

  def observations_descriptions
    observations.pluck(:description).to_string(', ')
  end
end
