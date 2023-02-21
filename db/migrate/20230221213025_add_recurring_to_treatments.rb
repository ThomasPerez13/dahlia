class AddRecurringToTreatments < ActiveRecord::Migration[7.0]
  def change
    add_column :treatments, :recurring, :boolean, default: false
  end
end
