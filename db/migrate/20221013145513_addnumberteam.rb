class Addnumberteam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :number_membership, :integer
  end
end
