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

ActiveRecord::Schema.define(version: 2018_11_19_011022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "population_percentage"
    t.bigint "scenario_id"
    t.index ["scenario_id"], name: "index_groups_on_scenario_id"
  end

  create_table "groups_possible_questions", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "possible_question_id", null: false
  end

  create_table "player_group_standings", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "group_id"
    t.decimal "current_standing"
    t.index ["group_id"], name: "index_player_group_standings_on_group_id"
    t.index ["player_id"], name: "index_player_group_standings_on_player_id"
  end

  create_table "player_histories", force: :cascade do |t|
    t.bigint "scenario_id"
    t.bigint "player_id"
    t.bigint "group_id"
    t.bigint "possible_question_id"
    t.bigint "possible_response_id"
    t.decimal "points_earned"
    t.string "notes"
    t.index ["group_id"], name: "index_player_histories_on_group_id"
    t.index ["player_id"], name: "index_player_histories_on_player_id"
    t.index ["possible_question_id"], name: "index_player_histories_on_possible_question_id"
    t.index ["possible_response_id"], name: "index_player_histories_on_possible_response_id"
    t.index ["scenario_id"], name: "index_player_histories_on_scenario_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
  end

  create_table "possible_questions", force: :cascade do |t|
    t.string "question"
    t.decimal "points"
  end

  create_table "possible_questions_responses", id: false, force: :cascade do |t|
    t.bigint "possible_question_id", null: false
    t.bigint "possible_response_id", null: false
  end

  create_table "possible_responses", force: :cascade do |t|
    t.string "response"
    t.decimal "points"
    t.decimal "group_standing_threshold"
  end

  create_table "scenarios", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "created_by"
  end

  add_foreign_key "groups", "scenarios"
  add_foreign_key "player_group_standings", "groups"
  add_foreign_key "player_group_standings", "players"
  add_foreign_key "player_histories", "groups"
  add_foreign_key "player_histories", "players"
  add_foreign_key "player_histories", "possible_questions"
  add_foreign_key "player_histories", "possible_responses"
  add_foreign_key "player_histories", "scenarios"
end
