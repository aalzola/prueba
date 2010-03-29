# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100328091455) do

  create_table "city_councils", :force => true do |t|
    t.string   "autonomousRegion"
    t.string   "state"
    t.string   "city"
    t.string   "adresss"
    t.string   "postalCode"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "matter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["id"], :name => "index_comments_on_id"
  add_index "comments", ["matter_id"], :name => "index_comments_on_matter_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "con_mayusculas", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matters", :force => true do |t|
    t.string   "name",        :limit => 50
    t.string   "description", :limit => 1000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "login",       :limit => 40
  end

  add_index "matters", ["city"], :name => "index_matters_on_city"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
