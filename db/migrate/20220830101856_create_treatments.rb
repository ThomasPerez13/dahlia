class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.string :category
      t.string :sub_category
      t.boolean :done
      t.text :content
      t.timestamps
    end
  end
end
