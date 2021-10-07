class CreateStudentProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :student_profiles do |t|
      t.string :grade
      t.boolean :adult
      t.integer :make_up_credits
      t.integer :status
      t.string :school
      
      t.references :student, null: false
    end
  end
end
