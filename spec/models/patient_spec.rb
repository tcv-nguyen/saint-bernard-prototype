require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject { create(:patient) }

  it { should belong_to :facility }
  it { should have_one(:admission).dependent(:destroy) }
  it { should have_many(:allergies).dependent(:destroy) }
  it { should have_many(:chronic_conditions).dependent(:destroy) }
  it { should have_many(:medications).dependent(:destroy) }
  it { should have_many(:diagnostic_procedures).dependent(:destroy) }
  it { should have_many(:diagnoses).dependent(:destroy) }
  it { should have_many(:treatments).dependent(:destroy) }

  it { should validate_inclusion_of(:gender).in_array(TermDefinitions::GENDERS) }

  describe "patient with_full_info" do
    let(:patient_with_full_info) { create(:patient, :with_full_info) }

    it { expect(patient_with_full_info.admission.persisted?).to be_truthy }
    it { expect(patient_with_full_info.allergies.count).to eq(1) }
    it { expect(patient_with_full_info.chronic_conditions.count).to eq(1) }
    it { expect(patient_with_full_info.medications.count).to eq(1) }
    it { expect(patient_with_full_info.diagnostic_procedures.count).to eq(1) }
    it { expect(patient_with_full_info.diagnoses.count).to eq(1) }
    it { expect(patient_with_full_info.treatments.count).to eq(1) }
  end
end
