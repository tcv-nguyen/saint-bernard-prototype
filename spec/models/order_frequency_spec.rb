require 'rails_helper'

RSpec.describe OrderFrequency, type: :model do
  subject { create(:order_frequency) }

  it { should validate_presence_of :value }
  it { should validate_inclusion_of(:unit).in_array(TermDefinitions::FREQUENCY_UNITS) }
end
