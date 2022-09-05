class AddGenderToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :gender, :string
  end
end
