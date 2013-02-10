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

ActiveRecord::Schema.define(:version => 20130210042244) do

  create_table "carriages", :force => true do |t|
    t.integer  "serial",          :limit => 8
    t.string   "model"
    t.string   "orientation"
    t.string   "stype"
    t.integer  "motor"
    t.integer  "pcb"
    t.string   "status"
    t.string   "warehouse_point"
    t.integer  "orderno"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "inventories", :force => true do |t|
    t.text     "name"
    t.text     "artwork"
    t.integer  "amount_left"
    t.integer  "amount_per_box"
    t.text     "notes"
    t.text     "department"
    t.text     "wh_position"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "seats", :force => true do |t|
    t.integer  "serial",     :limit => 8
    t.string   "model"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "hashed_pwd"
    t.integer  "access",     :default => 1
    t.boolean  "admin",      :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
