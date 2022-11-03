class RecurrencesController < ApplicationController
  def create
    @recurrence = Recurrence.new(recurrence_params)
    if @recurrence.save
      raise
      # Create matching consultations
      # Consultation.new(start_date, duration_in_min, patient_id, user_id, recurrence_id)
      # Compute start date of consultations
      # From recurrence start date until recurrence end date, every week create 1 consultation on Monday

      redirect_to consultation_path(@recurrence.consultations.first)
    else
      redirect_to new_consultation_path
    end
  end
  def recurrence_params
    params.require(:recurrence).permit(:patient_id, :start_date, :end_date, :frequency, :week)
  end
end
