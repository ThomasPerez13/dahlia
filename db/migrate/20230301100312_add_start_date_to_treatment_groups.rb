class AddStartDateToTreatmentGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :treatment_groups, :start_date, :datetime
  end
end
