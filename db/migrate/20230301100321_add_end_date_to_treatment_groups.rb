class AddEndDateToTreatmentGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :treatment_groups, :end_date, :datetime
  end
end
