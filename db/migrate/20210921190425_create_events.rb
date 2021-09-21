class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :student, null: true, foreign_key: true
      t.boolean :all_day
      t.datetime :start
      t.datetime :end
      t.time :start_time
      t.time :end_time
      t.date :start_recur
      t.date :end_recur
      t.string :title
      t.boolean :allow_registration
      t.integer :type
      t.integer :attendance
      t.boolean :visible
      t.string :location
      t.numeric :price
      
      t.timestamps
    end
  end
end
