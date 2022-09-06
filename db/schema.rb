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

ActiveRecord::Schema[7.0].define(version: 2022_09_05_083452) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultations", force: :cascade do |t|
    t.datetime "start_date", precision: nil
    t.integer "duration_in_min", default: 30
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
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

  add_foreign_key "consultations", "patients"
  add_foreign_key "consultations", "users"
  add_foreign_key "notes", "consultations", column: "creation_consultation_id"
  add_foreign_key "patients", "users", column: "referring_user_id"
  add_foreign_key "treatments", "consultations"
end
