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
end
