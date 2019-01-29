class OrderFrequency < ApplicationRecord
  validates :value, presence: true
  validates :unit, inclusion: { in: FREQUENCY_UNITS }, presence: true

  def description
    "#{value}#{unit}"
  end
end
