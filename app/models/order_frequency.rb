class OrderFrequency < ApplicationRecord
  validates :unit, inclusion: { in: FREQUENCY_UNITS }, presence: true
end
