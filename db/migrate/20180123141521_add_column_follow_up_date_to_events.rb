class AddColumnFollowUpDateToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :follow_up_date, :datetime
  end
end
