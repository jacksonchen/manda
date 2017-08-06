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

ActiveRecord::Schema.define(version: 20170731005326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string   "business"
    t.string   "business_role"
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
    t.string   "summary"
    t.integer  "approval"
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
    t.string   "finances_file_name"
    t.string   "finances_content_type"
    t.integer  "finances_file_size"
    t.datetime "finances_updated_at"
    t.integer  "approval"
    t.integer  "buyer_id"
    t.string   "summary"
    t.index ["buyer_id"], name: "index_companies_on_buyer_id", using: :btree
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

  create_table "conversations", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_conversations_on_buyer_id", using: :btree
    t.index ["company_id"], name: "index_conversations_on_company_id", using: :btree
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

  create_table "invites", force: :cascade do |t|
    t.string   "email"
    t.string   "token"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "company_id"
    t.boolean  "accepted",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["recipient_type", "recipient_id"], name: "index_messages_on_recipient_type_and_recipient_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "event_type"
    t.integer  "event_id"
    t.boolean  "read",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["event_type", "event_id"], name: "index_notifications_on_event_type_and_event_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "status"
    t.integer  "buyer_id"
    t.integer  "company_id"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_offers_on_buyer_id", using: :btree
    t.index ["company_id"], name: "index_offers_on_company_id", using: :btree
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
