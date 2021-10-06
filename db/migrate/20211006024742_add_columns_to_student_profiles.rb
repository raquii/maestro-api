class AddColumnsToStudentProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :student_profiles, :gender, :string
    add_column :student_profiles, :birthday, :date
  end
end
