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

ActiveRecord::Schema.define(version: 20150725195652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "sort_name",           null: false
    t.string   "home_page"
    t.integer  "birth_year"
    t.string   "gender"
    t.integer  "death_year"
    t.text     "notes"
    t.boolean  "show_large_images"
    t.string   "email"
    t.string   "telephone"
    t.text     "address"
    t.text     "private_notes"
    t.string   "missing_information"
    t.integer  "nationality_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "artists", ["birth_year"], name: "index_artists_on_birth_year", using: :btree
  add_index "artists", ["missing_information"], name: "index_artists_on_missing_information", using: :btree
  add_index "artists", ["name"], name: "index_artists_on_name", unique: true, using: :btree
  add_index "artists", ["sort_name"], name: "index_artists_on_sort_name", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
  end

  add_index "locations", ["name"], name: "index_locations_on_name", unique: true, using: :btree

  create_table "nationalities", force: :cascade do |t|
    t.string "name"
  end

  add_index "nationalities", ["name"], name: "index_nationalities_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.string   "title",               default: "",    null: false
    t.integer  "artist_id",                           null: false
    t.integer  "work_year"
    t.string   "work_display_date"
    t.string   "dimensions"
    t.text     "medium"
    t.string   "edition"
    t.integer  "acquisition_year"
    t.text     "description"
    t.text     "provenance"
    t.integer  "price_paid"
    t.text     "private_notes"
    t.string   "missing_information"
    t.integer  "market_value"
    t.integer  "market_value_year"
    t.integer  "location_id",                         null: false
    t.integer  "category_id",                         null: false
    t.boolean  "featured",            default: false, null: false
    t.string   "image_source"
    t.boolean  "published",           default: true,  null: false
    t.string   "tags",                default: [],                 array: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "works", ["artist_id"], name: "index_works_on_artist_id", using: :btree
  add_index "works", ["category_id"], name: "index_works_on_category_id", using: :btree
  add_index "works", ["featured"], name: "index_works_on_featured", using: :btree
  add_index "works", ["location_id"], name: "index_works_on_location_id", using: :btree
  add_index "works", ["published"], name: "index_works_on_published", using: :btree
  add_index "works", ["tags"], name: "index_works_on_tags", using: :gin
  add_index "works", ["title"], name: "index_works_on_title", using: :btree
  add_index "works", ["work_year"], name: "index_works_on_work_year", using: :btree

  add_foreign_key "works", "artists"
  add_foreign_key "works", "categories"
  add_foreign_key "works", "locations"
end
