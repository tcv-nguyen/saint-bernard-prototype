require 'rails_helper'

RSpec.describe DiagnosticProcedure, type: :model do
  subject { create(:diagnostic_procedure) }

  it { should belong_to :patient }

  it { should validate_presence_of :description }
  it { should validate_presence_of :moment }
end
