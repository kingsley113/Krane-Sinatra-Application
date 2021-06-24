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

ActiveRecord::Schema.define(version: 2021_06_24_065624) do

  create_table "daily_reports", force: :cascade do |t|
    t.string "work_completed"
    t.string "weather"
    t.string "deliveries"
    t.string "inspections"
    t.integer "workers_onsite"
    t.time "shift_start"
    t.time "shift_end"
    t.integer "user_id"
    t.integer "jobsite_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobsites", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "scheduled_duration"
    t.date "start_date"
    t.date "finish_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
  end

  create_table "user_jobsites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "jobsite_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "position"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
