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

ActiveRecord::Schema.define(version: 20161121180210) do

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "roll_no"
    t.string   "department"
    t.string   "batch"
    t.string   "program"
    t.string   "category"
    t.date     "dob"
    t.string   "nationality"
    t.string   "sex"
    t.string   "gpo_id"
    t.string   "alt_email"
    t.text     "hostel"
    t.string   "mobile"
    t.string   "alt_mobile"
    t.string   "home_contact"
    t.text     "permanent_addr"
    t.string   "specialization"
    t.string   "skype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
    t.boolean  "verified",        default: false
  end

  create_table "verifications", force: true do |t|
    t.string   "point"
    t.string   "mail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "proof_file_name"
    t.string   "proof_content_type"
    t.integer  "proof_file_size"
    t.datetime "proof_updated_at"
    t.integer  "student_id"
  end

  add_index "verifications", ["student_id"], name: "index_verifications_on_student_id"

end
