class PatientsController < ApplicationController
  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params_patient)
    @patient.referring_user_id = current_user
    if @patient.save
      redirect_to patient_path()
    else
      render :new
    end
  end

  private

  def params_patient
    params.require(:patient).permit(:first_name, :last_name, :address, :email, :tel_number, :ss_number, :referring_doctor, :emergency_contact_name, :emergency_contact_tel, :birth_day, :height, :weight, :blood_type)
  end
end
