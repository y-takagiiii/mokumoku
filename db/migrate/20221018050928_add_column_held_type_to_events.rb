class AddColumnHeldTypeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :held_type, :integer, default: 0, null: false
  end
end
