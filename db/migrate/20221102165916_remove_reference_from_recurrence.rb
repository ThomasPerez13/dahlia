class RemoveReferenceFromRecurrence < ActiveRecord::Migration[7.0]
  def change
    remove_reference :recurrences, :consultation, foreign_key: true, index: false
  end
end
