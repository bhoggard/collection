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

ActiveRecord::Schema.define(version: 20150725173754) do

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

end
