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

ActiveRecord::Schema.define(:version => 20100227232102) do

  create_table "accounts", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "joined_at"
    t.datetime "expired_at"
  end

  create_table "address_types", :force => true do |t|
    t.string "title",       :limit => 50, :null => false
    t.text   "description"
  end

  add_index "address_types", ["title"], :name => "index_address_types_on_title", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string "name",        :limit => 20, :null => false
    t.string "description",               :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "cities", :force => true do |t|
    t.string "title",        :limit => 75, :null => false
    t.string "url_friendly", :limit => 75, :null => false
  end

  add_index "cities", ["title"], :name => "index_cities_on_title", :unique => true
  add_index "cities", ["url_friendly"], :name => "index_cities_on_url_friendly", :unique => true

  create_table "email_address_types", :force => true do |t|
    t.string "title",       :limit => 50, :null => false
    t.text   "description"
  end

  add_index "email_address_types", ["title"], :name => "index_email_address_types_on_title", :unique => true

  create_table "email_addresses", :force => true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.integer  "email_address_type_id"
    t.boolean  "primary",               :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.text     "description"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.datetime "registration_start_date_time"
    t.datetime "registration_end_date_time"
    t.integer  "attendee_target_count"
    t.integer  "attendee_limit"
    t.text     "notes"
    t.text     "venue_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_number_types", :force => true do |t|
    t.string "title",       :limit => 50, :null => false
    t.text   "description"
  end

  add_index "phone_number_types", ["title"], :name => "index_phone_number_types_on_title", :unique => true

  create_table "postal_codes", :force => true do |t|
    t.string   "code"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string "title", :limit => 50, :null => false
    t.string "code",  :limit => 10, :null => false
  end

  add_index "states", ["code"], :name => "index_states_on_code", :unique => true
  add_index "states", ["title"], :name => "index_states_on_title", :unique => true

  create_table "suffixes", :force => true do |t|
    t.string "title", :limit => 20, :null => false
  end

  add_index "suffixes", ["title"], :name => "index_suffixes_on_title", :unique => true

  create_table "surnames", :force => true do |t|
    t.string "title", :limit => 15, :null => false
  end

  add_index "surnames", ["title"], :name => "index_surnames_on_title", :unique => true

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id",             :null => false
    t.date     "birthdate"
    t.text     "bio"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_profiles_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
