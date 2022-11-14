class AddRecurringColumnToConsultation < ActiveRecord::Migration[7.0]
  def change
    add_column :consultations, :recurring, :boolean, null: false, default: false
  end
end
