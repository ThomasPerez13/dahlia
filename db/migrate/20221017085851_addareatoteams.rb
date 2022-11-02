class Addareatoteams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :area, :string
  end
end
