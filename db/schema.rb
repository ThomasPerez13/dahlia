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

ActiveRecord::Schema[7.0].define(version: 2022_11_05_125739) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultation_groups", force: :cascade do |t|
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultations", force: :cascade do |t|
    t.datetime "start_date", precision: nil
    t.integer "duration_in_min", default: 30
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "recurring", default: false, null: false
    t.bigint "consultation_group_id"
    t.index ["consultation_group_id"], name: "index_consultations_on_consultation_group_id"
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["team_id"], name: "index_memberships_on_team_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.boolean "favorite"
    t.bigint "creation_consultation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creation_consultation_id"], name: "index_notes_on_creation_consultation_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "email"
    t.string "tel_number"
    t.string "ss_number"
    t.string "referring_doctor"
    t.string "emergency_contact_name"
    t.string "emergency_contact_tel"
    t.date "birth_day"
    t.integer "height"
    t.integer "weight"
    t.string "blood_type"
    t.bigint "referring_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.index ["referring_user_id"], name: "index_patients_on_referring_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_membership"
    t.string "area"
    t.integer "nb_member_to_add"
    t.index ["creator_id"], name: "index_teams_on_creator_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "category"
    t.string "sub_category"
    t.boolean "done"
    t.text "content"
    t.bigint "consultation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultation_id"], name: "index_treatments_on_consultation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "tel_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consultations", "consultation_groups"
  add_foreign_key "consultations", "patients"
  add_foreign_key "consultations", "users"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
  add_foreign_key "notes", "consultations", column: "creation_consultation_id"
  add_foreign_key "patients", "users", column: "referring_user_id"
  add_foreign_key "teams", "users", column: "creator_id"
  add_foreign_key "treatments", "consultations"
end
