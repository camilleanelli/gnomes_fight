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

ActiveRecord::Schema.define(version: 2019_10_13_184257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fights", force: :cascade do |t|
    t.bigint "gnome1_id"
    t.bigint "gnome2_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "winner_id"
    t.index ["gnome1_id"], name: "index_fights_on_gnome1_id"
    t.index ["gnome2_id"], name: "index_fights_on_gnome2_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "gnomes", force: :cascade do |t|
    t.integer "life_score"
    t.integer "fight_score"
    t.string "name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "fight_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "attacker_id"
    t.bigint "defenser_id"
    t.integer "initial_attacker_pv"
    t.integer "initial_defenser_pv"
    t.integer "defenser_damage_taken"
    t.index ["attacker_id"], name: "index_rounds_on_attacker_id"
    t.index ["defenser_id"], name: "index_rounds_on_defenser_id"
    t.index ["fight_id"], name: "index_rounds_on_fight_id"
  end

  add_foreign_key "rounds", "fights"
end
