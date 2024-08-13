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

ActiveRecord::Schema[7.1].define(version: 2024_07_26_152421) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "rfq_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "length", precision: 5
    t.decimal "width", precision: 5
    t.decimal "height", precision: 5
    t.decimal "weight", precision: 5
    t.string "special_conditions"
    t.index ["rfq_id"], name: "index_items_on_rfq_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "cost"
    t.string "special_conditions"
    t.boolean "state"
    t.integer "rfq_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "quote_submitted"
    t.index ["rfq_id"], name: "index_quotes_on_rfq_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "rfqs", force: :cascade do |t|
    t.string "pickup_name"
    t.string "pickup_street_address"
    t.string "pickup_city_area"
    t.string "pickup_city"
    t.string "pickup_county"
    t.string "pickup_postal"
    t.string "pickup_country"
    t.string "shipto_name"
    t.string "shipto_street_address"
    t.string "shipto_city_area"
    t.string "shipto_city"
    t.string "shipto_county"
    t.string "shipto_postal"
    t.string "shipto_country"
    t.date "pickup_date"
    t.date "delivery_date"
    t.boolean "state"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "length", precision: 5
    t.decimal "width", precision: 5
    t.decimal "height", precision: 5
    t.decimal "weight", precision: 5
    t.string "special_conditions"
    t.string "pickup_state"
    t.string "shipto_state"
    t.index ["user_id"], name: "index_rfqs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "password_confirmation"
    t.string "password_digest"
  end

  add_foreign_key "items", "rfqs"
  add_foreign_key "quotes", "rfqs"
  add_foreign_key "quotes", "users"
  add_foreign_key "rfqs", "users"
end
