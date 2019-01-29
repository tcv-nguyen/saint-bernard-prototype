require 'rails_helper'

RSpec.describe Observation, type: :model do
  subject { create(:observation) }

  it { should belong_to(:admission) }
end
