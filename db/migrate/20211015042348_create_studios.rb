class CreateStudios < ActiveRecord::Migration[6.1]
  def change
    create_table :studios do |t|
      t.string :name
      t.references :teacher_profile, null: false, foreign_key: true
    end
  end
end
