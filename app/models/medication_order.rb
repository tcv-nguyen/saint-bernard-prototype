class MedicationOrder < ApplicationRecord
  belongs_to :frequency, foreign_key: :order_frequency_id, class_name: 'OrderFrequency'
end
