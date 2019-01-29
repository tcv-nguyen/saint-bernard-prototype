require 'rails_helper'

RSpec.describe Facility, type: :model do
  subject { create(:facility) }

  it { should have_many :patients }
  
  it { should validate_uniqueness_of(:name) }
end
