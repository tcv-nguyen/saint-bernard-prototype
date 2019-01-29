require 'rails_helper'

RSpec.describe MedicationOrder, type: :model do
  subject { create(:medication_order) }

  it { should belong_to :patient }
  it { should belong_to :frequency }

  it { should validate_presence_of :name }
  it { should validate_presence_of :dosage }
  it { should validate_presence_of :unit }
  it { should validate_inclusion_of(:route).in_array(TermDefinitions::MEDICATION_ROUTES) }
  it { should validate_presence_of :necessity }
end
