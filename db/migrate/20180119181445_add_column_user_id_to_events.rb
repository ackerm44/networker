class AddColumnUserIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :user_id, :integer
    add_column :events, :organization_id, :integer
    add_column :contacts, :organization_id, :integer

  end
end
