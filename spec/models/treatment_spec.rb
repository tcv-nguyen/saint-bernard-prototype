require 'rails_helper'

RSpec.describe Treatment, type: :model do
  subject { create(:treatment) }

  it { should belong_to :patient }
end
