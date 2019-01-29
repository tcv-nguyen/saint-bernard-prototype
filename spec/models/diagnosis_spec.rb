require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  subject { create(:diagnosis) }

  it { should belong_to :patient }
  it { should belong_to :diagnosable }

  it { should validate_presence_of :coding_system }
  it { should validate_presence_of :description }
end

