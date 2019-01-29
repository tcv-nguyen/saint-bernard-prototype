require 'rails_helper'

RSpec.describe Allergy, type: :model do
  subject { create(:allergy) }

  it { should belong_to :patient }
end
