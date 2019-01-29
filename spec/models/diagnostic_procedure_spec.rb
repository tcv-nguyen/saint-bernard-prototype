require 'rails_helper'

RSpec.describe DiagnosticProcedure, type: :model do
  subject { create(:diagnostic_procedure) }

  it { should belong_to :patient }
end
