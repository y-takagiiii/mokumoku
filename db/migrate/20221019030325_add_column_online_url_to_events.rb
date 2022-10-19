class AddColumnOnlineUrlToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :online_url, :string
  end
end
