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

ActiveRecord::Schema.define(version: 20150606170949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "item_name"
    t.integer  "stock_quantity"
    t.decimal  "item_price"
    t.boolean  "item_active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "shoppingcartitems", force: :cascade do |t|
    t.integer  "shoppingcart_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.decimal  "subtotal"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "shoppingcartitems", ["item_id"], name: "index_shoppingcartitems_on_item_id", using: :btree
  add_index "shoppingcartitems", ["shoppingcart_id"], name: "index_shoppingcartitems_on_shoppingcart_id", using: :btree

  create_table "shoppingcarts", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "total"
    t.boolean  "order_active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "shoppingcarts", ["user_id"], name: "index_shoppingcarts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.date     "date_of_birth"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "items", "users"
  add_foreign_key "shoppingcartitems", "items"
  add_foreign_key "shoppingcartitems", "shoppingcarts"
  add_foreign_key "shoppingcarts", "users"
end
