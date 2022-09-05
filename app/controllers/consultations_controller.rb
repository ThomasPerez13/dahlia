class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.where(user: current_user)
  end

  def show
    @consultation = Consultation.find(params[:id])
    @notes = @consultation.notes
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
    @consultation.save
    redirect_to consultation_path(@consultation)
  end

  private

  def consultation_params
    params.require(:consultation).permit(:start_date, :patient_id)
  end
end
