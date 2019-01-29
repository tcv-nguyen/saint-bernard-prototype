require 'rails_helper'

RSpec.describe Allergy, type: :model do
  subject { create(:allergy) }

  it { should belong_to :patient }

  it { should validate_presence_of :description }
end
