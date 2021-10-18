class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.references :studio, null: false, foreign_key: true
    end
  end
end
