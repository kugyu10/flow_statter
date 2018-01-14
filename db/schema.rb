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

ActiveRecord::Schema.define(version: 20180107045506) do

  create_table "email_users", force: :cascade do |t|
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["user_id"], name: "index_email_users_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "user_id"
    t.string   "participater_name"
    t.integer  "number_of_unit"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "status"
    t.index ["plan_id"], name: "index_participations_on_plan_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.text     "content"
    t.integer  "status"
    t.date     "event_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "twitter_id"
    t.string   "nickname"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
