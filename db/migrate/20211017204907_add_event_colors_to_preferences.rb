class AddEventColorsToPreferences < ActiveRecord::Migration[6.1]
  def change
    add_column :preferences, :lesson_color, :string, default:"#b5b5da"
    add_column :preferences, :group_lesson_color, :string, default:"#33cfbc"
    add_column :preferences, :recital_color, :string, default:"#f9ac1f"
    add_column :preferences, :make_up_lesson_color, :string, default:"#ee7d68"
    add_column :preferences, :vacation_color, :string, default:"#b0d9f4"
    add_column :preferences, :birthday_color, :string, default:"#9de01f"
  end
end
