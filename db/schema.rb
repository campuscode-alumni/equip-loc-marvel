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

ActiveRecord::Schema.define(version: 20170223233053) do

  create_table "budgets", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_number"
    t.string   "email"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "contracts", force: :cascade do |t|
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
    t.integer  "equipment_id"
    t.integer  "customer_id"
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
    t.index ["equipment_id"], name: "index_contracts_on_equipment_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "customer_type"
    t.string   "document"
    t.string   "adress"
    t.string   "email"
    t.string   "contact_name"
    t.string   "phone_number"
    t.string   "state_registration"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "vip"
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

  create_table "equipment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "rental_period"
    t.integer  "equipment_type_id"
    t.decimal  "price"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["equipment_type_id"], name: "index_prices_on_equipment_type_id"
  end

  create_table "rented_equipments", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["contract_id"], name: "index_rented_equipments_on_contract_id"
    t.index ["equipment_id"], name: "index_rented_equipments_on_equipment_id"
  end

end
