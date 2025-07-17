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

ActiveRecord::Schema[8.0].define(version: 2025_07_17_004201) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pg_stat_statements"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bunk_assignments", force: :cascade do |t|
    t.bigint "reservation_week_id", null: false
    t.bigint "reservation_id", null: false
    t.bigint "bunk_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bunk_id"], name: "index_bunk_assignments_on_bunk_id"
    t.index ["reservation_id"], name: "index_bunk_assignments_on_reservation_id"
    t.index ["reservation_week_id", "bunk_id"], name: "index_bunk_assignments_on_reservation_week_id_and_bunk_id", unique: true
    t.index ["reservation_week_id"], name: "index_bunk_assignments_on_reservation_week_id"
  end

  create_table "bunks", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "owner_id"
    t.string "name", null: false
    t.string "bunk_type", null: false
    t.integer "order", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bunk_type"], name: "index_bunks_on_bunk_type"
    t.index ["order"], name: "index_bunks_on_order"
    t.index ["owner_id"], name: "index_bunks_on_owner_id"
    t.index ["room_id"], name: "index_bunks_on_room_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "message"
    t.integer "order"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "public_pins", id: :serial, force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.index ["user_id"], name: "index_public_pins_on_user_id"
  end

  create_table "reservation_weeks", id: :serial, force: :cascade do |t|
    t.text "note"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.date "res_date"
  end

  create_table "reservations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "wed"
    t.boolean "thur"
    t.boolean "fri"
    t.boolean "sat"
    t.boolean "sun"
    t.boolean "mon"
    t.boolean "tue"
    t.boolean "dinner"
    t.text "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.integer "reservation_week_id"
    t.string "sex"
    t.string "res_member_type"
    t.date "reservation_date"
    t.string "confirmation_number"
    t.index ["reservation_week_id"], name: "index_reservations_on_reservation_week_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.string "gender", null: false
    t.integer "order", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender"], name: "index_rooms_on_gender"
    t.index ["order"], name: "index_rooms_on_order"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "name"
    t.integer "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bunk_assignments", "bunks"
  add_foreign_key "bunk_assignments", "reservation_weeks"
  add_foreign_key "bunk_assignments", "reservations"
  add_foreign_key "bunks", "rooms"
  add_foreign_key "bunks", "users", column: "owner_id"
end
