require 'rails_helper'

RSpec.describe Symptom, type: :model do
  subject { create(:symptom) }

  it { should belong_to :admission }
end
