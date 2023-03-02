class TreatmentGroupsController < ApplicationController
  def destroy
    @treatment_group = TreatmentGroup.find(params[:id])
    @consultation = @treatment_group.treatments.first.consultation
    @treatment_group.destroy
    redirect_to consultation_path(@consultation), status: :see_other, info: "Les soins ont bien été supprimés"
  end
end
