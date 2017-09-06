# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170906084329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads_items", force: :cascade do |t|
    t.datetime "approval_date"
    t.text     "title"
    t.json     "images"
    t.text     "text"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.string   "aasm_state"
    t.text     "comment"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_ads_items_on_category_id", using: :btree
    t.index ["user_id"], name: "index_ads_items_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "ru"
    t.string   "en"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "count_of_ads", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "ads_items", "categories"
  add_foreign_key "ads_items", "users"
end
