class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.string :name
      t.references :studio, null: false, foreign_key: true
      t.timestamps
    end
  end
end
