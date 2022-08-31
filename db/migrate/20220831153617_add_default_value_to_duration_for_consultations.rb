class AddDefaultValueToDurationForConsultations < ActiveRecord::Migration[7.0]
  def change
    change_column :consultations, :duration_in_min, :integer, default: 30
  end
end
