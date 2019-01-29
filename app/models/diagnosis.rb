class Diagnosis < ApplicationRecord
  belongs_to :patient, optional: true
  belongs_to :diagnosable, polymorphic: true, optional: true
end
