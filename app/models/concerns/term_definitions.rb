module TermDefinitions
  GENDERS ||= %w(male female other)
  MASS_UNITS ||= %w(mg)
  MEDICATION_ROUTES ||= %w(PO IM SC)
  FREQUENCY_UNITS ||= %w(hour)
end

ActiveRecord::Base.send(:include, TermDefinitions)
