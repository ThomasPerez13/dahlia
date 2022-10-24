class Membertoadd < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :nb_member_to_add, :integer
  end
end
