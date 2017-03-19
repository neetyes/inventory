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

ActiveRecord::Schema.define(version: 20170318162937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "vdc_mun"
    t.integer  "ward_no"
    t.string   "phone"
    t.string   "vat_pan_no"
    t.string   "logo_url"
    t.string   "district"
    t.string   "zone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "fiscal_year_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_no"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fiscal_years", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "unit_id"
    t.string   "item_code"
    t.integer  "item_group_id"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "purchase_items", force: :cascade do |t|
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.decimal  "total"
    t.integer  "purchase_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "item_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "fiscal_year_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "bill_number"
    t.date     "purchase_date"
    t.decimal  "discount"
    t.decimal  "tax"
    t.decimal  "grand_total"
  end

  create_table "sale_items", force: :cascade do |t|
    t.decimal  "unit_price"
    t.string   "item_id"
    t.string   "sale_id"
    t.string   "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "total"
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "fiscal_year_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "bill_number"
    t.date     "sales_date"
    t.decimal  "discount"
    t.decimal  "tax"
    t.string   "grand_total"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.decimal  "est_sell_price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_no"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "print_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
