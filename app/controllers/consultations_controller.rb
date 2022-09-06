class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.where(user: current_user)
  end

  def show
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
    @consultations = @patient.consultations


    @second_to_last_consultation = @consultations[-2]
    @no_favorite_notes = @second_to_last_consultation.notes
    @notes = @consultations.map do |consultation|
      consultation.notes
    end
    @favorite_notes = @notes.select do |note|
      note.favorite
    end
    @final_notes = @favorite_notes + @no_favorite_notes
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
