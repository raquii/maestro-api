class AddLessonRemindersToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :student_profiles, :lesson_reminder_emails, :boolean
    add_column :guardian_profiles, :lesson_reminder_emails, :boolean
    add_column :student_profiles, :lesson_reminder_sms, :boolean
    add_column :guardian_profiles, :lesson_reminder_sms, :boolean
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
