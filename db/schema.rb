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

ActiveRecord::Schema[7.1].define(version: 2024_09_09_122035) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "board_threads", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "bt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_count", default: 0
    t.boolean "pinned", default: false
    t.index ["board_id"], name: "index_board_threads_on_board_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.string "handle"
    t.string "category"
    t.text "description"
    t.boolean "private", default: false
    t.bigint "user_id", null: false
    t.bigint "b_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "board_threads_count", default: 0
    t.boolean "official", default: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.boolean "is_op", default: false
    t.bigint "board_thread_id", null: false
    t.text "content"
    t.integer "rating", default: 0
    t.bigint "user_id"
    t.bigint "p_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "photo_url"
    t.string "type"
    t.bigint "parent_post_id"
    t.index ["board_thread_id"], name: "index_posts_on_board_thread_id"
    t.index ["parent_post_id"], name: "index_posts_on_parent_post_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_subscriptions_on_board_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.integer "value", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_votes_on_post_id"
    t.index ["user_id", "post_id"], name: "index_votes_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "board_threads", "boards"
  add_foreign_key "boards", "users"
  add_foreign_key "posts", "board_threads"
  add_foreign_key "posts", "users"
  add_foreign_key "subscriptions", "boards"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "votes", "posts"
  add_foreign_key "votes", "users"
end
