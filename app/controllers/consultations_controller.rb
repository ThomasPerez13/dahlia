class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.where(user: current_user)
  end

  def show
    @consultation = Consultation.find(params[:id])
    @notes = @consultation.notes
  end
end
