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

ActiveRecord::Schema.define(version: 2019_05_24_203918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "demographics", force: :cascade do |t|
    t.string "english"
    t.string "french"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "development_actors", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_demographics", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "demographic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_development_actors", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "development_actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_research_methods", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "research_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_sectors", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_methods", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
