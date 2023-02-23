class ChangeTreatmentGroupsToTreatmentGroupInTreatments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :treatments, :treatment_groups, foreign_key: true
    add_reference :treatments, :treatment_group, foreign_key: true
  end
end
