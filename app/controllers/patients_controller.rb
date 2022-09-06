class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    if params[:query].present?
      @patients = @patients.where("first_name ILIKE ?", "%#{params[:query]}%")
    else
      @patients = @patients.order(last_name: :asc)
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @consultations = @patient.consultations
    # @treatments =
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params_patient)
    @patient.referring_user = current_user

    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  private

  def params_patient
    params.require(:patient).permit(:first_name,
      :last_name,
      :gender,
      :address,
      :email,
      :tel_number,
      :ss_number,
      :referring_doctor,
      :emergency_contact_name,
      :emergency_contact_tel,
      :birth_day,
      :height,
      :weight,
      :blood_type
    )
  end
end
