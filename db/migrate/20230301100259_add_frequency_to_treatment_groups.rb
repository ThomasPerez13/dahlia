class AddFrequencyToTreatmentGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :treatment_groups, :frequency, :string
  end
end
