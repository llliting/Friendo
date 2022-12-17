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

ActiveRecord::Schema.define(version: 20221215004715) do

  create_table "activities", force: :cascade do |t|
    t.string   "event_name"
    t.integer  "max_size"
    t.integer  "current_size"
    t.text     "description"
    t.string   "category"
    t.datetime "date"
    t.string   "location"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "creator_id"
    t.string   "open_status"
  end

  create_table "activity_user_relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower"
    t.integer "followee"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
  end

end
