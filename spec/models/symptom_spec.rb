require 'rails_helper'

RSpec.describe Symptom, type: :model do
  subject { create(:symptom) }

  it { should belong_to :admission }

  it { should validate_presence_of :description }
end
