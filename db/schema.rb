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

ActiveRecord::Schema[8.1].define(version: 2026_07_15_000001) do
  create_table "suburbs", force: :cascade do |t|
    t.string "city"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "postcode"
    t.string "region"
    t.datetime "updated_at", null: false
    t.index ["name", "city"], name: "index_suburbs_on_name_and_city", unique: true
    t.index ["postcode"], name: "index_suburbs_on_postcode"
  end

  create_table "voting_places", force: :cascade do |t|
    t.boolean "accessible", default: false, null: false
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.datetime "created_at", null: false
    t.string "electorate"
    t.datetime "imported_at"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "name", null: false
    t.text "notes"
    t.text "opening_hours"
    t.string "postcode"
    t.string "source_dataset"
    t.string "source_id", null: false
    t.datetime "source_last_updated"
    t.integer "suburb_id", null: false
    t.datetime "updated_at", null: false
    t.string "venue_type"
    t.index ["city"], name: "index_voting_places_on_city"
    t.index ["electorate"], name: "index_voting_places_on_electorate"
    t.index ["postcode"], name: "index_voting_places_on_postcode"
    t.index ["source_id"], name: "index_voting_places_on_source_id", unique: true
    t.index ["suburb_id"], name: "index_voting_places_on_suburb_id"
  end

  add_foreign_key "voting_places", "suburbs"
end
