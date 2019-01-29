require 'rails_helper'

RSpec.describe MedicationOrder, type: :model do
  subject { create(:medication_order) }

  it { should belong_to :frequency }
end
