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

ActiveRecord::Schema[7.1].define(version: 2024_05_01_134029) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_threads", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "user_id"
    t.bigint "bt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_count", default: 0
    t.boolean "pinned", default: false
    t.index ["board_id"], name: "index_board_threads_on_board_id"
    t.index ["user_id"], name: "index_board_threads_on_user_id"
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
    t.integer "post_rating", default: 0
    t.bigint "user_id"
    t.bigint "p_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_thread_id"], name: "index_posts_on_board_thread_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "board_threads", "boards"
  add_foreign_key "board_threads", "users"
  add_foreign_key "boards", "users"
  add_foreign_key "posts", "board_threads"
  add_foreign_key "posts", "users"
  add_foreign_key "votes", "posts"
  add_foreign_key "votes", "users"
end
