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

ActiveRecord::Schema.define(version: 20160624205754) do

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
    t.string   "prize"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "amount_of_players",  default: 7
    t.string   "bases_file_name"
    t.string   "bases_content_type"
    t.integer  "bases_file_size"
    t.datetime "bases_updated_at"
    t.integer  "half_time"
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
    t.integer  "min_price"
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

  create_table "price_options", force: :cascade do |t|
    t.string   "comment"
    t.integer  "price"
    t.integer  "preinscription_price"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "cup_id"
  end

  add_index "price_options", ["cup_id"], name: "index_price_options_on_cup_id"

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "resource_attr"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "grade"
  end

  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "role",                   default: 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "profile_image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
