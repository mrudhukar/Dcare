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

ActiveRecord::Schema.define(:version => 20120414104800) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "line1"
    t.string   "line2"
    t.string   "district"
    t.string   "state"
    t.string   "country"
    t.string   "pin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "phone_types", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phones", :force => true do |t|
    t.integer  "user_id"
    t.integer  "phone_number"
    t.integer  "phone_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "phones", ["phone_type_id"], :name => "index_phones_on_phone_type_id"
  add_index "phones", ["user_id"], :name => "index_phones_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                  :null => false
    t.string   "perishable_token",   :default => "", :null => false
    t.integer  "login_count",        :default => 0,  :null => false
    t.integer  "failed_login_count", :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.date     "date_of_birth"
    t.string   "gender"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
