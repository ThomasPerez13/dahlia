class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.where(user: current_user)
  end
end
