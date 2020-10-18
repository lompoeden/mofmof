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

ActiveRecord::Schema.define(version: 2020_09_30_044906) do

  create_table "properties", force: :cascade do |t|
      t.string "property"
      t.string "rent"
      t.string "address"
      t.string "age"
      t.string "remarks"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "stations", force: :cascade do |t|
      t.string "line_name"
      t.string "station_name"
      t.string "minutes_on_foot"
      t.integer "property_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["property_id"], name: "index_stations_on_property_id"
    end

    add_foreign_key "stations", "properties"
  end
