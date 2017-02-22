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

ActiveRecord::Schema.define(version: 20170221232115) do

  create_table "contracts", force: :cascade do |t|
    t.string   "client"
    t.string   "equipment"
    t.integer  "rental_period"
    t.float    "amount"
    t.float    "discount"
    t.float    "total_amount"
    t.string   "delivery_address"
    t.string   "contact"
    t.string   "payment_method"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "serial_number"
    t.decimal  "acquisition_value"
    t.datetime "acquisition_date"
    t.integer  "shelf_life"
    t.string   "picture"
    t.string   "equipment_type"
    t.string   "manufacture"
    t.string   "vendor"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
