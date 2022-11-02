class AddColumnToRecurrences < ActiveRecord::Migration[7.0]
  def change
    add_column :recurrences, :week, :jsonb
  end
end
