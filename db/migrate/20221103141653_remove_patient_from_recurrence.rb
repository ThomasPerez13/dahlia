class RemovePatientFromRecurrence < ActiveRecord::Migration[7.0]
  def change
    remove_column :recurrences, :patient
  end
end
