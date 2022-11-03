class AddPatientReferenceToRecurrence < ActiveRecord::Migration[7.0]
  def change
    add_reference :recurrences, :patient, foreign_key: true
  end
end
