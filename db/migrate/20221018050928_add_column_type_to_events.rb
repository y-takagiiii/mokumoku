class AddColumnTypeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :type, :string, default: 0, :null: false
  end
end
