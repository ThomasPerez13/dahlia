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

  def edit
    @treatment = Treatment.find(params[:id])
  end

  def update
    @treatment = Treatment.find(params[:id])
    params[:treatment][:done] == "1" ? @treatment.done = true : @treatment.done = false
    @treatment.update(params_treatment)
    redirect_to consultation_path(@treatment.consultation)

  end
  def destroy
    @treatment = Treatment.find(params[:id])
    @treatment.destroy
    redirect_to consultation_path(@treatment.consultation), status: :see_other
  end

  private

  def params_treatment
    params.require(:treatment).permit(:content, :category)
  end
end
