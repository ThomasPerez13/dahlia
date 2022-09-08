class ConsultationsController < ApplicationController
  def index
    params[:next_date] ||= Date.today.to_s
    date = Date.parse(params[:next_date])
    params[:current_day] ||= date
    @consultations = Consultation.where(user: current_user).where(start_date: params[:current_day].beginning_of_day..params[:current_day].end_of_day).order(:start_date)
  end

  def show
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @consultations = @patient.consultations
    @latest_consultation = @consultations.where(start_date: ...@consultation.start_date).order(:start_date).last

    @notes_from_previous_consultations = Note.where(favorite: false, creation_consultation_id: @latest_consultation.id )
    @favorite_notes = Note.joins(:creation_consultation).where(favorite: true, creation_consultation: { patient_id: @patient.id })
    @final_notes = @favorite_notes + @notes_from_previous_consultations
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:start_date, :patient_id, :user_id)
  end
end
