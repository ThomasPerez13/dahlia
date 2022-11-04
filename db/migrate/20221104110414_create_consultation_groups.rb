class CreateConsultationGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :consultation_groups do |t|
      t.date :start_date
      t.date :end_date
      t.string :frequency

      t.timestamps
    end
  end
end
