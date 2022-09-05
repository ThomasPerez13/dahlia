class PatientsController < ApplicationController
  def show
    @patient = Patient.find(params[:id])
    @consultations = @patient.consultations
    # @treatments = 
  end
end
