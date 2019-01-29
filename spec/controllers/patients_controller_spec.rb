require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  let(:facility) { create(:facility, name: 'Blue Alps Ski Camp') }

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assign @patients' do
      patients = create_list(:patient, 5, :with_full_info, facility: facility)

      get :index
      expect(assigns(:patients).to_a.sort_by(&:id)).to eq(patients.to_a.sort_by(&:id))
    end
  end

  describe 'GET show' do
    before do
      @patient = create(:patient,
        facility: facility,
        first_name: 'Thomas',
        last_name: 'Schudel',
        mr: '30997',
        dob: 43.years.ago,
        gender: 'male'
      )
      create(:allergy, patient: @patient, description: 'hypersensitivity to aspirin or NSAIDs')
      create(:allergy, patient: @patient, description: 'gluten intolerance')
      # Create Patient's chronic conditions
      create(:diagnosis,
        diagnosable: @patient,
        coding_system: 'J45',
        code: '',
        description: 'Asthma'
      )
      # Create Patient's medications
      create(:medication_order,
        patient: @patient,
        name: 'Acetaminophen',
        unit: 'mg',
        dosage: '500',
        route: 'PO',
        frequency: create(:order_frequency, value: 'q4', unit: 'hr'),
        necessity: 'relieve pain,'
      )
      create(:medication_order,
        patient: @patient,
        name: 'Naproxen',
        unit: 'mg',
        dosage: '500',
        route: 'PO',
        frequency: create(:order_frequency, value: 'q6', unit: 'hr'),
        necessity: 'relieve swelling'
      )
      create(:diagnostic_procedure,
        patient: @patient,
        description: 'an exploratory radiography',
        moment: '2019-01-29 17:15'
      )
      # Create Patient's diagnoses
      create(:diagnosis,
        patient: @patient,
        coding_system: 'S82',
        code: '101A',
        description: 'a closed fracture in the right tibia'
      )
      create(:treatment,
        patient: @patient,
        description: 'temporary bracing the right leg',
        necessity: 'restrict the motion'
      )
      # Admission
      admission = create(:admission, patient: @patient, moment: '2018-02-18 17:07')
      # Create Admission's diagnoses
      create(:diagnosis,
        diagnosable: admission,
        coding_system: 'S82',
        code: '101',
        description: 'a fracture of upper end of the right tibia'
      )
      create(:symptom, admission: admission, description: 'severe pain')
      create(:symptom, admission: admission, description: 'swelling')
      create(:symptom, admission: admission, description: 'limited bending of the joint')
      create(:observation, admission: admission, description: 'No soft tissues were damaged')

      get :show, params: { id: @patient.id }
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'assigns @patient' do
      expect(assigns(:patient)).to eq(@patient)
    end

    it 'render all patient info' do
      body_html = response.body
      patient_admission = 'This 43 years old male was admitted to Blue Alps Ski Camp on February 18, 2018, at 5:07 pm due to a 
        fracture of upper end of the right tibia (S82.101).'
      admission_symptoms = ['severe pain', 'swelling', 'limited bending of the joint']
      admission_observation = 'No soft tissues were damaged.'
      patient_allergies = 'Upon asking about known allergies, the patient disclosed hypersensitivity to aspirin or NSAIDs and 
        gluten intolerance.'
      patient_chronic_conditions = 'Upon asking about chronic conditions, the patient disclosed Asthma (J45).'
      medications = 'The patient was administered with Acetaminophen 500mg PO q4hr to relieve pain, and Naproxen 500mg PO q6hr 
        to relieve swelling.'
      diagnostic_procedure = 'The staff performed an exploratory radiography at 5:15 pm'
      patient_diagnosis = 'revealing a closed fracture in the right tibia (S82.101A)'
      treatment = 'Our team proceeded to temporary bracing the right leg to restrict the motion.'

      expect(body_html).to have_content(patient_admission)
      expect(body_html).to have_content(admission_observation)
      expect(body_html).to have_content(patient_allergies)
      expect(body_html).to have_content(patient_chronic_conditions)
      expect(body_html).to have_content(medications)
      expect(body_html).to have_content(diagnostic_procedure)
      expect(body_html).to have_content(patient_diagnosis)
      expect(body_html).to have_content(treatment)
      admission_symptoms.each do |symptom|
        expect(body_html).to have_content(symptom)
      end
    end
  end
end
