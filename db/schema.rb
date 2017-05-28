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

ActiveRecord::Schema.define(version: 20170528162417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string   "company"
    t.string   "company_role"
    t.string   "name"
    t.integer  "age"
    t.string   "corporate_email"
    t.string   "phone"
    t.text     "address"
    t.integer  "gender"
    t.integer  "education"
    t.string   "education_institution"
    t.string   "expertise",             default: [],              array: true
    t.string   "linkedin"
    t.text     "startup_background"
    t.text     "about"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_buyers_on_user_id", unique: true, using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "email"
    t.string   "phone"
    t.string   "location"
    t.integer  "price"
    t.integer  "founded"
    t.integer  "available"
    t.text     "financials"
    t.text     "originality"
    t.text     "legal"
    t.text     "about"
    t.integer  "user_base"
    t.text     "growth"
    t.integer  "opportunity"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "funding_report_file_name"
    t.string   "funding_report_content_type"
    t.integer  "funding_report_file_size"
    t.datetime "funding_report_updated_at"
    t.string   "userbase_analytics_file_name"
    t.string   "userbase_analytics_content_type"
    t.integer  "userbase_analytics_file_size"
    t.datetime "userbase_analytics_updated_at"
    t.string   "llc_file_name"
    t.string   "llc_content_type"
    t.integer  "llc_file_size"
    t.datetime "llc_updated_at"
    t.string   "tax_file_name"
    t.string   "tax_content_type"
    t.integer  "tax_file_size"
    t.datetime "tax_updated_at"
    t.string   "equity_division_file_name"
    t.string   "equity_division_content_type"
    t.integer  "equity_division_file_size"
    t.datetime "equity_division_updated_at"
  end

  create_table "companies_company_categories", id: false, force: :cascade do |t|
    t.integer "company_id"
    t.integer "company_category_id"
    t.index ["company_category_id"], name: "index_companies_company_categories_on_company_category_id", using: :btree
    t.index ["company_id"], name: "index_companies_company_categories_on_company_id", using: :btree
  end

  create_table "company_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string   "employable_type"
    t.integer  "employable_id"
    t.string   "name"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["employable_type", "employable_id"], name: "index_employers_on_employable_type_and_employable_id", using: :btree
  end

  create_table "sellers", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "company_role"
    t.string   "name"
    t.integer  "age"
    t.string   "corporate_email"
    t.string   "phone"
    t.text     "address"
    t.integer  "gender"
    t.integer  "education"
    t.string   "education_institution"
    t.string   "expertise",             default: [],              array: true
    t.string   "linkedin"
    t.integer  "equity"
    t.string   "ssn"
    t.text     "about"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.index ["company_id"], name: "index_sellers_on_company_id", using: :btree
    t.index ["user_id"], name: "index_sellers_on_user_id", unique: true, using: :btree
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_type"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "buyers", "users", on_delete: :cascade
  add_foreign_key "sellers", "users", on_delete: :cascade
end
