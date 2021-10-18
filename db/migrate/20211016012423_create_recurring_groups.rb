class CreateRecurringGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :recurring_groups do |t|
      t.datetime :end_date
      
    end
  end
end
