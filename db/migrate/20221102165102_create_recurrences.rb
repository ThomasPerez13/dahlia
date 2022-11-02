class CreateRecurrences < ActiveRecord::Migration[7.0]
  def change
    create_table :recurrences do |t|
      t.date :start_date
      t.date :end_date
      t.string :frequency
      t.references :consultation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
