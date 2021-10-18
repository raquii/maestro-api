class CreateGuardianProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :guardian_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :email
      t.references :user, null: true, foreign_key: true
      t.references :studio, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
