class PatientsController < ApplicationController
  before_action :load_patients

  private
    def load_patients
      if params[:action] == 'index'
        @patients = Patient.all
      else
        @patient = Patient.eager_load(:facility, :allergies, :chronic_conditions, :diagnostic_procedures, :diagnoses, :treatments, 
          { admission: [:diagnoses, :symptoms, :observations], medications: [:frequency] })
          .find(params[:id])
      end
    end
end
