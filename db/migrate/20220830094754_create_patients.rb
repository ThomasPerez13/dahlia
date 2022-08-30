class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :tel_number
      t.string :ss_number
      t.string :referring_doctor
      t.string :emergency_contact_name
      t.string :emergency_contact_tel
      t.date :birth_day
      t.integer :height
      t.integer :weight
      t.string :blood_type
      t.references :referring_user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
