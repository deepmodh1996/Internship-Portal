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

ActiveRecord::Schema.define(version: 20161122060630) do

  create_table "company_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "country"
    t.string   "pin"
    t.string   "url"
    t.string   "contact_person"
    t.string   "designation"
    t.string   "email"
    t.string   "contact_number"
    t.string   "cell_number"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "iafs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "profile"
    t.text     "intern_job_description", limit: 65535
    t.text     "place_of_posting",       limit: 65535
    t.integer  "stipend"
    t.date     "opens_on"
    t.date     "closes_on"
    t.float    "cpi_cutoff",             limit: 24
    t.string   "departments"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "cse"
    t.boolean  "elec"
    t.boolean  "mech"
    t.boolean  "meta"
    t.integer  "company_information_id"
    t.index ["company_information_id"], name: "index_iafs_on_company_information_id", using: :btree
  end

  create_table "shortlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "iaf_id"
    t.integer  "student_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
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
    t.text     "hostel",          limit: 65535
    t.string   "mobile"
    t.string   "alt_mobile"
    t.string   "home_contact"
    t.text     "permanent_addr",  limit: 65535
    t.string   "specialization"
    t.string   "skype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
  end

  create_table "verifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "point"
    t.string   "mail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "proof_file_name"
    t.string   "proof_content_type"
    t.integer  "proof_file_size"
    t.datetime "proof_updated_at"
    t.integer  "student_id"
    t.index ["student_id"], name: "index_verifications_on_student_id", using: :btree
  end

end
