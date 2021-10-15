class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :teacher, null: false
      t.references :student, null: true
      t.boolean :all_day
      t.datetime :start
      t.datetime :end
      t.string :start_time
      t.string :end_time
      t.date :start_recur
      t.date :end_recur
      t.string :title
      t.boolean :allow_registration
      t.integer :event_type
      t.integer :attendance
      t.boolean :visible
      t.string :location
      t.numeric :price
      
      t.timestamps
    end
  end
end
