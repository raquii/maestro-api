class CreateParents < ActiveRecord::Migration[6.1]
  def change
    create_table :parents do |t|
      t.string :secondary_phone
      t.boolean :primary_contact
      t.references :family, null: false, foreign_key: true
      t.timestamps
    end
  end
end
