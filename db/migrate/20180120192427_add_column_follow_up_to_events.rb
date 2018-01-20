class AddColumnFollowUpToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :follow_up, :boolean
  end
end
