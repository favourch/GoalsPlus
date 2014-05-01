# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140417035309) do

  create_table "cities", force: true do |t|
    t.string "name", null: false
    t.integer "timezone_id", null: false
    t.integer "country_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree
  add_index "cities", ["timezone_id"], name: "index_cities_on_timezone_id", using: :btree

  create_table "continents", force: true do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.string "federation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "continents", ["code"], name: "index_continents_on_code", unique: true, using: :btree
  add_index "continents", ["name"], name: "index_continents_on_name", unique: true, using: :btree

  create_table "countries", force: true do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.integer "continent_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["code"], name: "index_countries_on_code", unique: true, using: :btree
  add_index "countries", ["continent_id"], name: "index_countries_on_continent_id", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", unique: true, using: :btree

  create_table "guesses", force: true do |t|
    t.integer "user_id"
    t.integer "match_id"
    t.integer "goals_a", null: false
    t.integer "goals_b", null: false
    t.integer "pens_a"
    t.integer "pens_b"
    t.integer "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guesses", ["match_id"], name: "index_guesses_on_match_id", using: :btree
  add_index "guesses", ["user_id", "match_id"], name: "index_guesses_on_user_id_and_match_id", unique: true, using: :btree
  add_index "guesses", ["user_id"], name: "index_guesses_on_user_id", using: :btree

  create_table "languages", force: true do |t|
    t.string "name", null: false
    t.string "code", null: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", unique: true, using: :btree

  create_table "matches", force: true do |t|
    t.integer "team_a_id", default: 1
    t.integer "team_b_id", default: 1
    t.integer "stadium_id", default: 1
    t.integer "tournament_id", default: 31
    t.integer "stage_id", default: 1
    t.datetime "date"
    t.integer "timezone_id", default: 146, null: false
    t.boolean "pens", default: false, null: false
    t.integer "goals_a"
    t.integer "goals_b"
    t.integer "pens_a"
    t.integer "pens_b"
    t.float "coof_a", default: 1.0
    t.float "coof_x", default: 1.0
    t.float "coof_b", default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["stadium_id"], name: "index_matches_on_stadium_id", using: :btree
  add_index "matches", ["stage_id"], name: "index_matches_on_stage_id", using: :btree
  add_index "matches", ["team_a_id"], name: "index_matches_on_team_a_id", using: :btree
  add_index "matches", ["team_b_id"], name: "index_matches_on_team_b_id", using: :btree
  add_index "matches", ["timezone_id"], name: "index_matches_on_timezone_id", using: :btree
  add_index "matches", ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree

  create_table "roles", force: true do |t|
    t.string "name", null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "settings", force: true do |t|
    t.string "screen_name", default: "", null: false
    t.string "cell_phone"
    t.integer "role_id", default: 1, null: false
    t.integer "timezone_id", default: 6
    t.integer "team_id", default: 1
    t.string "beer", default: "Beer"
    t.integer "language_id", default: 1
  end

  add_index "settings", ["language_id"], name: "index_settings_on_language_id", using: :btree
  add_index "settings", ["role_id"], name: "index_settings_on_role_id", using: :btree
  add_index "settings", ["screen_name"], name: "index_settings_on_screen_name", unique: true, using: :btree
  add_index "settings", ["team_id"], name: "index_settings_on_team_id", using: :btree
  add_index "settings", ["timezone_id"], name: "index_settings_on_timezone_id", using: :btree

  create_table "stadia", force: true do |t|
    t.string "name", null: false
    t.integer "city_id", null: false
    t.integer "capacity", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stadia", ["city_id"], name: "index_stadia_on_city_id", using: :btree

  create_table "stages", force: true do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string "name", null: false
    t.string "short", null: false
    t.integer "stadium_id", null: false
    t.boolean "national", default: false, null: false
    t.integer "rating", default: -1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["stadium_id"], name: "index_teams_on_stadium_id", using: :btree

  create_table "timezones", force: true do |t|
    t.string "name"
    t.string "tzinfo"
    t.string "utc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string "name", null: false
    t.string "short", null: false
    t.boolean "international", default: true, null: false
    t.boolean "club", default: true, null: false
    t.integer "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tournaments", ["name"], name: "index_tournaments_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string "user_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "setting_id", default: 1, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["setting_id"], name: "index_users_on_setting_id", using: :btree

end
