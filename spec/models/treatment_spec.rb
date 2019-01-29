require 'rails_helper'

RSpec.describe Treatment, type: :model do
  subject { create(:treatment) }

  it { should belong_to :patient }

  it { should validate_presence_of :description }
  it { should validate_presence_of :necessity }
end
