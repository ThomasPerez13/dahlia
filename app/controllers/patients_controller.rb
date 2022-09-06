class PatientsController < ApplicationController
  def show
    @patient = Patient.find(params[:id])
  end

  def index
    @patients = Patient.where(referring_user: current_user)
    if params[:query].present?
      @patients = @patients.where("first_name ILIKE ?", "%#{params[:query]}%")
    else
      @patients
    end
  end
end
