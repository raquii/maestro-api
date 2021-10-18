class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :teacher_profile, null: false, foreign_key: true
      t.references :student_profile, null: true, foreign_key: true
      t.boolean :all_day
      t.datetime :start
      t.datetime :end
      t.string :title
      t.boolean :allow_registration
      t.integer :event_type
      t.integer :attendance
      t.boolean :visible
      t.string :location
      t.numeric :price
      t.references :recurring_group, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
