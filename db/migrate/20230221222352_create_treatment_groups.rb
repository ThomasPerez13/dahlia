class CreateTreatmentGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :treatment_groups do |t|

      t.timestamps
    end
  end
end
