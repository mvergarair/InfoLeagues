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

ActiveRecord::Schema.define(version: 20160517145440) do

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.integer  "code"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cups", force: :cascade do |t|
    t.integer  "league_id"
    t.integer  "location_id"
    t.integer  "day"
    t.integer  "price"
    t.string   "prize"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "amount_of_players", default: 7
  end

  add_index "cups", ["league_id"], name: "index_cups_on_league_id"
  add_index "cups", ["location_id"], name: "index_cups_on_location_id"

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "website_link"
    t.string   "facebook_link"
    t.string   "instagram_link"
    t.string   "twitter_link"
    t.boolean  "uses_liga_fc",      default: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.string   "phone"
    t.string   "email"
    t.integer  "county_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["county_id"], name: "index_locations_on_county_id"

end
