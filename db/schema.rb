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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131001022005) do

  create_table "application_states", :force => true do |t|
    t.boolean  "orders_open",   :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.text     "announcements"
    t.text     "pickup_info"
    t.text     "about"
    t.string   "email_signoff"
  end

  create_table "cart_items", :force => true do |t|
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "quantity",   :limit => 10
    t.integer  "cart_id"
    t.integer  "item_id"
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "inventories", :force => true do |t|
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "url"
    t.text     "description",  :limit => 255
    t.string   "display_name"
    t.boolean  "hidden",                      :default => false
  end

  create_table "inventory_photos", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "inventory_id"
  end

  create_table "item_photos", :force => true do |t|
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.boolean  "available",                                              :default => false
    t.string   "units"
    t.decimal  "price",                   :precision => 10, :scale => 2
    t.integer  "minorder",                                               :default => 1
    t.integer  "maxorder"
    t.integer  "totalquantity",                                          :default => 0
    t.integer  "totalordered",                                           :default => 0
    t.string   "description"
    t.datetime "created_at",                                                                :null => false
    t.datetime "updated_at",                                                                :null => false
    t.integer  "inventory_id"
    t.string   "item_photo_file_name"
    t.string   "item_photo_content_type"
    t.integer  "item_photo_file_size"
    t.datetime "item_photo_updated_at"
    t.integer  "category_id"
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "cart_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "paid",         :default => false
    t.string   "order_set"
    t.integer  "inventory_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "encrypted_password"
    t.boolean  "member",                 :default => true
    t.boolean  "coordinator",            :default => false
    t.boolean  "producer",               :default => false
    t.boolean  "admin",                  :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "salt"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
