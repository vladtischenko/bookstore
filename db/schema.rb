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

ActiveRecord::Schema.define(version: 20140411074924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "authors", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
  end

  add_index "authors", ["book_id"], name: "index_authors_on_book_id", using: :btree

  create_table "bill_addresses", force: true do |t|
    t.string   "city"
    t.string   "street"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "zipcode"
    t.string   "phone"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "bill_addresses", ["country_id"], name: "index_bill_addresses_on_country_id", using: :btree
  add_index "bill_addresses", ["user_id"], name: "index_bill_addresses_on_user_id", using: :btree

  create_table "books", force: true do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "description"
    t.string   "picture"
    t.string   "in_stock"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.integer  "rating_id"
    t.integer  "category_id"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree
  add_index "books", ["rating_id"], name: "index_books_on_rating_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
  end

  add_index "categories", ["book_id"], name: "index_categories_on_book_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", force: true do |t|
    t.string   "code"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "coupons", ["order_id"], name: "index_coupons_on_order_id", using: :btree

  create_table "credit_cards", force: true do |t|
    t.string   "expiration_month"
    t.integer  "expiration_year"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.string   "card_number"
  end

  add_index "credit_cards", ["user_id"], name: "index_credit_cards_on_user_id", using: :btree

  create_table "deliveries", force: true do |t|
    t.string   "text"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "deliveries", ["order_id"], name: "index_deliveries_on_order_id", using: :btree

  create_table "order_items", force: true do |t|
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
    t.integer  "order_id"
    t.float    "total"
  end

  add_index "order_items", ["book_id"], name: "index_order_items_on_book_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "order_item_id"
    t.float    "subtotal"
    t.string   "state"
    t.string   "number"
    t.datetime "completed_at"
    t.float    "order_total"
    t.integer  "delivery_id"
    t.integer  "coupon_id"
  end

  add_index "orders", ["coupon_id"], name: "index_orders_on_coupon_id", using: :btree
  add_index "orders", ["delivery_id"], name: "index_orders_on_delivery_id", using: :btree
  add_index "orders", ["order_item_id"], name: "index_orders_on_order_item_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
    t.integer  "user_id"
    t.boolean  "allow"
    t.string   "title"
    t.integer  "rate"
  end

  add_index "ratings", ["book_id"], name: "index_ratings_on_book_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "ship_addresses", force: true do |t|
    t.string   "city"
    t.string   "street"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "zipcode"
    t.string   "phone"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "ship_addresses", ["country_id"], name: "index_ship_addresses_on_country_id", using: :btree
  add_index "ship_addresses", ["user_id"], name: "index_ship_addresses_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.integer  "credit_card_id"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["bill_address_id"], name: "index_users_on_bill_address_id", using: :btree
  add_index "users", ["credit_card_id"], name: "index_users_on_credit_card_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["ship_address_id"], name: "index_users_on_ship_address_id", using: :btree

end
