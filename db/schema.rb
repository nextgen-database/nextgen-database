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

ActiveRecord::Schema.define(version: 2020_07_07_212445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliation_positions", force: :cascade do |t|
    t.bigint "affiliation_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliation_id"], name: "index_affiliation_positions_on_affiliation_id"
    t.index ["position_id"], name: "index_affiliation_positions_on_position_id"
  end

  create_table "affiliations", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organisation_id"], name: "index_affiliations_on_organisation_id"
    t.index ["profile_id"], name: "index_affiliations_on_profile_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demographics", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "development_actors", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organisation_types", force: :cascade do |t|
    t.string "english"
    t.string "french"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organisation_type_id"
    t.bigint "province_id"
    t.string "abbreviation_en"
    t.string "abbreviation_fr"
    t.index ["organisation_type_id"], name: "index_organisations_on_organisation_type_id"
    t.index ["province_id"], name: "index_organisations_on_province_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "department_en"
    t.string "department_fr"
    t.string "faculty_en"
    t.string "faculty_fr"
    t.bigint "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_positions_on_title_id"
  end

  create_table "prefixes", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_countries", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "country_id"
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

  create_table "profile_regions", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "profile_id", null: false
    t.integer "status", default: 0
    t.integer "approver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_requests_on_profile_id"
    t.index ["status"], name: "index_profile_requests_on_status"
    t.index ["user_id"], name: "index_profile_requests_on_user_id"
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

  create_table "profile_subregions", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "subregion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_sustainable_development_goals", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "sustainable_development_goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "idx_psdg_profile"
    t.index ["sustainable_development_goal_id"], name: "idx_psdg_sdg"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "phone_number"
    t.string "website"
    t.bigint "user_id"
    t.bigint "prefix_id"
    t.string "twitter"
    t.string "linkedin"
    t.string "academia_edu"
    t.string "phone_ext"
    t.boolean "visible", default: true
    t.index ["prefix_id"], name: "index_profiles_on_prefix_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "english"
    t.string "french"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_methods", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_profile_terms", force: :cascade do |t|
    t.string "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["term"], name: "index_search_profile_terms_on_term", unique: true
  end

  create_table "search_profiles", force: :cascade do |t|
    t.integer "search_profile_term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "search_profile_sdg_param", default: 0
  end

  create_table "sectors", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subregions", force: :cascade do |t|
    t.string "english", null: false
    t.string "french", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sustainable_development_goals", force: :cascade do |t|
    t.integer "code", limit: 2, null: false
    t.string "title_en", null: false
    t.string "title_fr", null: false
    t.string "description_en", null: false
    t.string "description_fr", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "banner_en", null: false
    t.string "banner_fr", null: false
  end

  create_table "titles", force: :cascade do |t|
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
    t.integer "role"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "affiliations", "organisations"
  add_foreign_key "affiliations", "profiles"
  add_foreign_key "organisations", "organisation_types"
  add_foreign_key "organisations", "provinces"
  add_foreign_key "positions", "titles"
  add_foreign_key "profile_requests", "profiles"
  add_foreign_key "profile_requests", "users"
  add_foreign_key "profile_sustainable_development_goals", "profiles"
  add_foreign_key "profile_sustainable_development_goals", "sustainable_development_goals"
  add_foreign_key "profiles", "prefixes"
  add_foreign_key "profiles", "users"
end
