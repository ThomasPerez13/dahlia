class PatientsController < ApplicationController

  def index
    @patients = Patient.all.order(last_name: :asc)
    if params[:query].present?
      @patients_last_name = @patients.where("last_name ILIKE ?", "%#{params[:query]}%")
      @patients_first_name = @patients.where("first_name ILIKE ?", "%#{params[:query]}%")
      @patients = @patients_first_name + @patients_last_name
      @patients.uniq
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "patients/list", locals: {patients: @patients}, formats: [:html] }
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @consultations = @patient.consultations
    @past_consultations = @patient.consultations.where(start_date: ..Time.zone.now).order(:start_date)
    @last_3_consultations = @past_consultations.last(3)
    @former_consultations = @past_consultations - @last_3_consultations
    @last_consultation = @past_consultations.last

    @last_3_consultations_minus_one = @last_3_consultations.reverse.slice(0..-2)
    @last_3_consultations_rest = @last_3_consultations.reverse.slice(-2.next..-1)
    @past_consultations_minus_one = @past_consultations.reverse.slice(0..-2)
    @past_consultations_rest = @past_consultations.reverse.slice(-2.next..-1)
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
