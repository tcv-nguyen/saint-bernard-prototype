class MedicationOrder < ApplicationRecord
  belongs_to :patient
  belongs_to :frequency, foreign_key: :order_frequency_id, class_name: 'OrderFrequency'

  validates :name, presence: true
  validates :dosage, presence: true
  validates :unit, presence: true
  validates :route, inclusion: { in: MEDICATION_ROUTES }
  validates :necessity, presence: true

  delegate :description, to: :frequency, prefix: true

  def description
    [name, "#{dosage.to_i}#{unit}", route, frequency_description, 'to', necessity].join(' ')
  end
end
