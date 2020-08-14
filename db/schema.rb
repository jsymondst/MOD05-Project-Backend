# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_29_100315) do

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "connections", default: 0
    t.string "game_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "closed", default: false
    t.boolean "hidden", default: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "message_type"
    t.string "username"
    t.index ["game_id"], name: "index_messages_on_game_id"
  end

  create_table "tictactoeturns", force: :cascade do |t|
    t.string "action"
    t.string "piece"
    t.string "posx"
    t.string "posy"
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_tictactoeturns_on_game_id"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "game_id", null: false
    t.string "game_type"
    t.string "action"
    t.integer "turn_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "message"
    t.index ["game_id"], name: "index_turns_on_game_id"
  end

  add_foreign_key "messages", "games"
  add_foreign_key "tictactoeturns", "games"
  add_foreign_key "turns", "games"
end
