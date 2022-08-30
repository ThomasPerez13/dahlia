class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.text :content
      t.boolean :favorite
      t.references :creation_consultation, null: false, foreign_key: {to_table: :consultations}

      t.timestamps
    end
  end
end
