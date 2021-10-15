# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_15_042348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "student_id"
    t.boolean "all_day"
    t.datetime "start"
    t.datetime "end"
    t.string "start_time"
    t.string "end_time"
    t.date "start_recur"
    t.date "end_recur"
    t.string "title"
    t.boolean "allow_registration"
    t.integer "event_type"
    t.integer "attendance"
    t.boolean "visible"
    t.string "location"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "make_up_credit_required", default: false
    t.boolean "default_lesson", default: false
    t.integer "days_of_week"
    t.index ["student_id"], name: "index_events_on_student_id"
    t.index ["teacher_id"], name: "index_events_on_teacher_id"
  end

  create_table "families", force: :cascade do |t|
    t.bigint "studio_id", null: false
    t.index ["studio_id"], name: "index_families_on_studio_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp"
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "cancellation_deadline", default: 24
    t.boolean "permit_cancellations", default: true
    t.boolean "permit_event_registration", default: true
    t.integer "event_registration_deadline", default: 24
    t.boolean "permit_make_up_credits", default: true
    t.boolean "issue_make_up_credit_before_deadline", default: true
    t.boolean "expire_make_up_credits", default: false
    t.integer "max_credit_age", default: 0
    t.boolean "limit_total_make_up_credits", default: true
    t.integer "max_total_make_up_credits", default: 4
    t.text "cancellation_policy_summary", default: ""
    t.boolean "default_event_visibility", default: true
    t.integer "default_lesson_price", default: 0
    t.integer "default_lesson_duration", default: 0
    t.integer "initial_view", default: 0
    t.string "slot_min_time", default: "08:00"
    t.string "slot_max_time", default: "21:00"
    t.boolean "weekends", default: true
    t.string "location", default: ""
    t.boolean "students_can_edit_profile", default: true
    t.string "lesson_color", default: "#b5b5da"
    t.string "group_lesson_color", default: "#33cfbc"
    t.string "recital_color", default: "#f9ac1f"
    t.string "make_up_lesson_color", default: "#ee7d68"
    t.string "vacation_color", default: "#b0d9f4"
    t.string "birthday_color", default: "#9de01f"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "student_profiles", force: :cascade do |t|
    t.string "grade"
    t.boolean "adult"
    t.integer "make_up_credits"
    t.integer "status"
    t.string "school"
    t.bigint "student_id", null: false
    t.decimal "default_lesson_price"
    t.integer "default_lesson_duration"
    t.string "gender"
    t.date "birthday"
    t.index ["student_id"], name: "index_student_profiles_on_student_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_id", null: false
    t.index ["teacher_id"], name: "index_studios_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.integer "role", default: 0
    t.bigint "studio_id"
    t.boolean "lesson_reminder_emails"
    t.boolean "lesson_reminder_sms"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.bigint "family_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["family_id"], name: "index_users_on_family_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["studio_id"], name: "index_users_on_studio_id"
  end

  add_foreign_key "families", "studios"
  add_foreign_key "preferences", "users"
  add_foreign_key "users", "families"
  add_foreign_key "users", "studios"
end
