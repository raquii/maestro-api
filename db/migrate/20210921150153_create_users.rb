class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.integer :role, default: 0
      t.references :studio, null: true, foreign_key: true
      t.boolean :lesson_reminder_emails
      t.boolean :lesson_reminder_sms
      
      t.timestamps
    end
  end
end
