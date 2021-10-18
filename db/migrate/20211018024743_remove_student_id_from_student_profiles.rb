class RemoveStudentIdFromStudentProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_reference :student_profiles, :student, index: true
  end
end
