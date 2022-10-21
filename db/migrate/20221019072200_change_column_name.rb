class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :held_type, :location
  end
end
