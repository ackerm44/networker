class ChangeDateColumnToDatetimeInEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :date, :datetime
  end
end
