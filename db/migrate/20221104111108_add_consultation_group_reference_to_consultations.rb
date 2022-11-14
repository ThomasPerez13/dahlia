class AddConsultationGroupReferenceToConsultations < ActiveRecord::Migration[7.0]
  def change
    add_reference :consultations, :consultation_group, foreign_key: true
  end
end
