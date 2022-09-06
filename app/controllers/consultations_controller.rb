class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.where(user: current_user)
  end

  def show
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @consultations = @patient.consultations
    @latest_consultations = @consultations.where(start_date: ...@consultation.start_date).order(:start_date).last
    @notes_from_previous_consultations = @latest_consultations.nil? ? [] : @latest_consultations.notes

    @favorite_notes = Note.joins(:creation_consultation).where(favorite: true, creation_consultation: { patient_id: @patient.id })

    @final_notes = @favorite_notes + @notes_from_previous_consultations
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:start_date, :patient_id)
  end
end
