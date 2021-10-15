class AddDaysOfWeekToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :days_of_week, :integer
  end
end
