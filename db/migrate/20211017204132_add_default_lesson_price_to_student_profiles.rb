class AddDefaultLessonPriceToStudentProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :student_profiles, :default_lesson_price, :decimal
  end
end
