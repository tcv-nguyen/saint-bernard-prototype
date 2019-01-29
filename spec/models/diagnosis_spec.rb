require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  subject { create(:diagnosis) }

  it { should belong_to :patient }
  it { should belong_to :diagnosable }
end
