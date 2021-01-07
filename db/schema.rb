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

ActiveRecord::Schema.define(version: 3) do

  create_table "patients", force: :cascade do |t|
    t.string "username"
    t.string "chosen_name"
    t.string "location"
    t.string "phone_number"
    t.string "email"
    t.string "gender_id"
    t.string "sexual_id"
    t.string "sex_at_birth"
    t.string "race"
    t.string "age"
    t.string "insurance"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "date"
    t.integer "patient_id"
    t.integer "therapist_id"
    t.boolean "completed"
  end

  create_table "therapists", force: :cascade do |t|
    t.string "username"
    t.string "chosen_name"
    t.string "location"
    t.string "phone_number"
    t.string "email"
    t.string "gender_id"
    t.string "sexual_id"
    t.string "sex_at_birth"
    t.string "race"
    t.integer "age"
    t.boolean "lcpc"
    t.boolean "lcp"
    t.boolean "lmhc"
    t.boolean "mft"
    t.boolean "lcsw"
    t.boolean "cmhimp"
    t.string "education"
    t.string "insurance"
  end

end
