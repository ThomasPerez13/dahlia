class AddTreatmentGroupsReferenceToTreatments < ActiveRecord::Migration[7.0]
  def change
    add_reference :treatments, :treatment_groups, foreign_key: true
  end
end
