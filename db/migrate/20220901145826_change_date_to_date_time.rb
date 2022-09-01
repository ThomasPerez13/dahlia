class ChangeDateToDateTime < ActiveRecord::Migration[7.0]
  def change
    change_column :consultations, :start_date, :datetime
  end
end
