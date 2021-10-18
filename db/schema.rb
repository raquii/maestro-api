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

ActiveRecord::Schema.define(version: 2021_10_18_024743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "teacher_profile_id", null: false
    t.bigint "student_profile_id"
    t.boolean "all_day"
    t.datetime "start"
    t.datetime "end"
    t.string "title"
    t.boolean "allow_registration"
    t.integer "event_type"
    t.integer "attendance"
    t.boolean "visible"
    t.string "location"
    t.decimal "price"
    t.bigint "recurring_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "make_up_credit_required", default: false
    t.boolean "default_lesson", default: false
    t.index ["recurring_group_id"], name: "index_events_on_recurring_group_id"
    t.index ["student_profile_id"], name: "index_events_on_student_profile_id"
    t.index ["teacher_profile_id"], name: "index_events_on_teacher_profile_id"
  end

  create_table "families", force: :cascade do |t|
    t.bigint "studio_id", null: false
    t.index ["studio_id"], name: "index_families_on_studio_id"
  end

  create_table "guardian_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "email"
    t.bigint "user_id"
    t.bigint "studio_id", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_guardian_profiles_on_family_id"
    t.index ["studio_id"], name: "index_guardian_profiles_on_studio_id"
    t.index ["user_id"], name: "index_guardian_profiles_on_user_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp"
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "teacher_profile_id", null: false
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
    t.index ["teacher_profile_id"], name: "index_preferences_on_teacher_profile_id"
  end

  create_table "recurring_groups", force: :cascade do |t|
    t.datetime "end_date"
  end

  create_table "student_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "email"
    t.bigint "user_id"
    t.bigint "studio_id", null: false
    t.bigint "family_id", null: false
    t.string "grade"
    t.boolean "adult"
    t.integer "make_up_credits"
    t.integer "status"
    t.string "school"
    t.string "notes"
    t.decimal "default_lesson_price"
    t.integer "default_lesson_duration"
    t.string "gender"
    t.date "birthday"
    t.index ["family_id"], name: "index_student_profiles_on_family_id"
    t.index ["studio_id"], name: "index_student_profiles_on_studio_id"
    t.index ["user_id"], name: "index_student_profiles_on_user_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_profile_id", null: false
    t.index ["teacher_profile_id"], name: "index_studios_on_teacher_profile_id"
  end

  create_table "teacher_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "email"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teacher_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", default: 0
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
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "recurring_groups"
  add_foreign_key "events", "student_profiles"
  add_foreign_key "events", "teacher_profiles"
  add_foreign_key "families", "studios"
  add_foreign_key "guardian_profiles", "families"
  add_foreign_key "guardian_profiles", "studios"
  add_foreign_key "guardian_profiles", "users"
  add_foreign_key "preferences", "teacher_profiles"
  add_foreign_key "student_profiles", "families"
  add_foreign_key "student_profiles", "studios"
  add_foreign_key "student_profiles", "users"
  add_foreign_key "studios", "teacher_profiles"
  add_foreign_key "teacher_profiles", "users"
end
