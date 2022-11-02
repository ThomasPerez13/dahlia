class AddPatientToRecurrence < ActiveRecord::Migration[7.0]
  def change
    add_column :recurrences, :patient, :string
  end
end
