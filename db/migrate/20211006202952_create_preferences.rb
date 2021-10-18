class CreatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :preferences do |t|
      t.references :teacher_profile, foreign_key: true, null: false
      t.integer :cancellation_deadline, default: 24
      t.boolean :permit_cancellations, default: true
      t.boolean :permit_event_registration, default: true
      t.integer :event_registration_deadline, default: 24
      t.boolean :permit_make_up_credits, default: true
      t.boolean :issue_make_up_credit_before_deadline, default: true
      t.boolean :expire_make_up_credits, default: false
      t.integer :max_credit_age, default: 0
      t.boolean :limit_total_make_up_credits, default: true
      t.integer :max_total_make_up_credits, default: 4
      t.text :cancellation_policy_summary, default: ""
      t.boolean :default_event_visibility, default: true
      t.integer :default_lesson_price, default: 0
      t.integer :default_lesson_duration, default: 0
      t.integer :initial_view, default: 0
      t.string :slot_min_time, default:"08:00"
      t.string :slot_max_time, default:"21:00"
      t.boolean :weekends, default: true
      t.string :location, default: ""
      t.boolean :students_can_edit_profile, default: true

    end
  end
end
