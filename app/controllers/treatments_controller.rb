class TreatmentsController < ApplicationController
  def new
    @treatment = Treatment.new()
  end

  def create
    @treatment = Treatment.new(params_treatment)
    @treatment.consultation = Consultation.find(params[:consultation_id])
    if @treatment.save
      redirect_to consultation_path(@treatment.consultation)
    else
      render :new
    end
  end

  private

  def params_treatment
    params.require(:treatment).permit(:content, :category)
  end
end
