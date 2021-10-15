class AddDefaultLessonToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :default_lesson, :boolean, default: false
  end
end
