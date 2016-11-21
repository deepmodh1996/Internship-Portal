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

ActiveRecord::Schema.define(version: 20161121094656) do

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

end
