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

ActiveRecord::Schema.define(:version => 20100228012547) do

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

  create_table "alerts", :force => true do |t|
    t.string   "name"
    t.string   "alerttext"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "categorizations", :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "item_id",     :null => false
  end

  add_index "categorizations", ["item_id", "category_id"], :name => "index_categorizations_on_item_id_and_category_id", :unique => true

  create_table "cities", :force => true do |t|
    t.string "title",        :limit => 75, :null => false
    t.string "url_friendly", :limit => 75, :null => false
  end

  add_index "cities", ["title"], :name => "index_cities_on_title", :unique => true
  add_index "cities", ["url_friendly"], :name => "index_cities_on_url_friendly", :unique => true

  create_table "committee_assets", :force => true do |t|
    t.integer "asset_id",     :null => false
    t.integer "committee_id", :null => false
  end

  create_table "committee_blogs", :force => true do |t|
    t.string  "title",   :null => false
    t.integer "user_id", :null => false
    t.string  "text",    :null => false
  end

  create_table "committee_events", :force => true do |t|
    t.integer "event_id",     :null => false
    t.integer "committee_id", :null => false
  end

  create_table "committee_members", :force => true do |t|
    t.integer "member_id",                       :null => false
    t.integer "committee_id",                    :null => false
    t.boolean "lead",         :default => false, :null => false
  end

  create_table "committee_posts", :force => true do |t|
    t.string  "title",   :null => false
    t.integer "user_id", :null => false
    t.string  "text",    :null => false
  end

  create_table "committees", :force => true do |t|
    t.string  "name",        :null => false
    t.string  "description", :null => false
    t.boolean "active"
  end

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

  create_table "postal_code_types", :force => true do |t|
    t.string   "title",        :limit => 50, :null => false
    t.string   "url_friendly", :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postal_code_types", ["url_friendly"], :name => "index_postal_code_types_on_url_friendly", :unique => true

  create_table "postal_codes", :force => true do |t|
    t.string   "code"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "postal_code_type_id"
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

  create_table "user_addresses", :force => true do |t|
    t.integer  "user_id",                            :null => false
    t.text     "street"
    t.integer  "postal_code_id",                     :null => false
    t.integer  "address_type_id",                    :null => false
    t.boolean  "is_primary",      :default => false
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_addresses", ["address_type_id"], :name => "index_user_addresses_on_address_type_id"
  add_index "user_addresses", ["postal_code_id"], :name => "index_user_addresses_on_postal_code_id"
  add_index "user_addresses", ["user_id"], :name => "index_user_addresses_on_user_id"

  create_table "user_phone_numbers", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.integer  "phone_number_type_id", :null => false
    t.string   "number",               :null => false
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "user_roles", :force => true do |t|
    t.string "role",        :limit => 50, :null => false
    t.text   "description"
  end

  add_index "user_roles", ["role"], :name => "index_user_roles_on_role", :unique => true

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_profiles_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_name"
    t.integer  "surname_id"
    t.integer  "suffix_id"
    t.string   "gender"
  end

  create_table "users_roles", :force => true do |t|
    t.integer "user_id",      :null => false
    t.integer "user_role_id", :null => false
  end

  add_index "users_roles", ["user_id", "user_role_id"], :name => "by_user", :unique => true
  add_index "users_roles", ["user_id"], :name => "index_users_roles_on_user_id"
  add_index "users_roles", ["user_role_id"], :name => "index_users_roles_on_user_role_id"

end
