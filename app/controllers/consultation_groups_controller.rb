class ConsultationGroupsController < ApplicationController
  def destroy
    @consultation_group = ConsultationGroup.find(params[:id])
    @patient = @consultation_group.consultations.first.patient
    @consultation_group.destroy
    redirect_to patient_path(@patient), status: :see_other, info: "Les consultations ont bien été supprimées"
  end
end
