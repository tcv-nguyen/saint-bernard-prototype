class Diagnosis < ApplicationRecord
  belongs_to :patient, optional: true
  belongs_to :diagnosable, polymorphic: true, optional: true

  validates :coding_system, presence: true
  validates :description, presence: true

  def described_code
    "#{description} (#{[coding_system, code].reject(&:blank?).join('.')})"
  end
end
