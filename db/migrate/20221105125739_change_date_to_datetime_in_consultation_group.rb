class ChangeDateToDatetimeInConsultationGroup < ActiveRecord::Migration[7.0]
  def change
    change_column :consultation_groups, :start_date, :datetime
    change_column :consultation_groups, :end_date, :datetime
  end
end
