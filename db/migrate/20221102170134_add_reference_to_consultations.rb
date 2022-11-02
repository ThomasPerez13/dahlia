class AddReferenceToConsultations < ActiveRecord::Migration[7.0]
  def change
    add_reference :consultations, :recurrence, foreign_key: true
  end
end
