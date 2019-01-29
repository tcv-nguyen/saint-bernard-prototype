require 'rails_helper'

RSpec.describe Admission, type: :model do
  subject { create(:admission) }

  it { should have_many(:diagnoses).dependent(:destroy) }
  it { should have_many(:symptoms).dependent(:destroy) }
  it { should have_many(:observations).dependent(:destroy) }

  it { should validate_presence_of :moment }
end
