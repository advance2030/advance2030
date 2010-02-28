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

ActiveRecord::Schema.define(:version => 20100228194033) do

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
    t.integer  "user_id"
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

  create_table "av_equipment_options", :force => true do |t|
    t.string "title", :limit => 100, :null => false
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

  create_table "event_notes", :force => true do |t|
    t.integer  "event_id",   :null => false
    t.text     "note",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_notes", ["event_id"], :name => "index_event_notes_on_event_id"

  create_table "events", :force => true do |t|
    t.string   "name",                        :null => false
    t.string   "url_friendly",                :null => false
    t.text     "summary"
    t.text     "description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "registration_start_datetime"
    t.datetime "registration_end_datetime"
    t.integer  "attendee_target_count"
    t.integer  "attendee_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fee_options", :force => true do |t|
    t.string "title",       :limit => 50, :null => false
    t.text   "description"
  end

  create_table "food_service_options", :force => true do |t|
    t.string "title",       :limit => 100, :null => false
    t.text   "description"
  end

  create_table "industries", :force => true do |t|
    t.string   "title",       :limit => 100, :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "link_types", :force => true do |t|
    t.string "title", :limit => 100, :null => false
  end

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url",                           :null => false
    t.text     "description"
    t.boolean  "is_active",   :default => true
    t.integer  "hits",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["url"], :name => "index_links_on_url", :unique => true

  create_table "order_transactions", :force => true do |t|
    t.integer  "amount"
    t.boolean  "success"
    t.string   "reference"
    t.string   "message"
    t.string   "action"
    t.text     "params"
    t.boolean  "test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "amount"
    t.string   "description"
    t.string   "state",       :default => "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organization_addresses", :force => true do |t|
    t.integer  "address_type_id", :null => false
    t.integer  "organization_id", :null => false
    t.text     "street"
    t.integer  "postal_code_id",  :null => false
    t.boolean  "is_primary"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_addresses", ["address_type_id"], :name => "index_organization_addresses_on_address_type_id"
  add_index "organization_addresses", ["organization_id"], :name => "index_organization_addresses_on_organization_id"
  add_index "organization_addresses", ["postal_code_id"], :name => "index_organization_addresses_on_postal_code_id"

  create_table "organization_email_addresses", :force => true do |t|
    t.integer  "email_address_type_id", :null => false
    t.integer  "organization_id",       :null => false
    t.string   "address",               :null => false
    t.boolean  "is_primary"
    t.boolean  "is_confirmed"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_email_addresses", ["address"], :name => "index_organization_email_addresses_on_address", :unique => true
  add_index "organization_email_addresses", ["email_address_type_id"], :name => "index_organization_email_addresses_on_email_address_type_id"
  add_index "organization_email_addresses", ["organization_id"], :name => "index_organization_email_addresses_on_organization_id"

  create_table "organization_links", :force => true do |t|
    t.integer "link_type_id",    :null => false
    t.integer "organization_id", :null => false
    t.integer "link_id",         :null => false
    t.boolean "is_primary"
    t.integer "sort_order"
  end

  add_index "organization_links", ["link_id"], :name => "index_organization_links_on_link_id"
  add_index "organization_links", ["link_type_id"], :name => "index_organization_links_on_link_type_id"
  add_index "organization_links", ["organization_id"], :name => "index_organization_links_on_organization_id"

  create_table "organization_phone_numbers", :force => true do |t|
    t.integer  "phone_number_type_id", :null => false
    t.integer  "organization_id",      :null => false
    t.string   "number",               :null => false
    t.boolean  "is_primary"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_phone_numbers", ["organization_id"], :name => "index_organization_phone_numbers_on_organization_id"
  add_index "organization_phone_numbers", ["phone_number_type_id"], :name => "index_organization_phone_numbers_on_phone_number_type_id"

  create_table "organization_roles", :force => true do |t|
    t.string "role",        :limit => 50, :null => false
    t.text   "description"
  end

  add_index "organization_roles", ["role"], :name => "index_organization_roles_on_role", :unique => true

  create_table "organization_social_medias", :force => true do |t|
    t.integer  "social_media_type_id", :null => false
    t.integer  "organization_id",      :null => false
    t.string   "username",             :null => false
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_social_medias", ["organization_id"], :name => "index_organization_social_medias_on_organization_id"
  add_index "organization_social_medias", ["social_media_type_id"], :name => "index_organization_social_medias_on_social_media_type_id"
  add_index "organization_social_medias", ["username"], :name => "index_organization_social_medias_on_username", :unique => true

  create_table "organization_types", :force => true do |t|
    t.string   "title",      :limit => 150, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name",                 :null => false
    t.string   "legal_name"
    t.string   "dba"
    t.string   "tax_identification"
    t.integer  "user_id"
    t.integer  "service_region_id",    :null => false
    t.integer  "organization_type_id", :null => false
    t.text     "mission"
    t.integer  "local_staff_size"
    t.integer  "total_staff_size"
    t.float    "annual_revenue"
    t.string   "logo_file_name"
    t.integer  "logo_file_size"
    t.string   "logo_content_type"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["organization_type_id"], :name => "index_organizations_on_organization_type_id"
  add_index "organizations", ["service_region_id"], :name => "index_organizations_on_service_region_id"
  add_index "organizations", ["user_id"], :name => "index_organizations_on_user_id"

  create_table "organizations_industries", :force => true do |t|
    t.integer "organization_id", :null => false
    t.integer "industry_id",     :null => false
  end

  add_index "organizations_industries", ["industry_id"], :name => "index_organizations_industries_on_industry_id"
  add_index "organizations_industries", ["organization_id", "industry_id"], :name => "by_industry", :unique => true
  add_index "organizations_industries", ["organization_id"], :name => "index_organizations_industries_on_organization_id"

  create_table "organizations_roles", :force => true do |t|
    t.integer "organization_role_id", :null => false
    t.integer "organization_id",      :null => false
  end

  add_index "organizations_roles", ["organization_id"], :name => "index_organizations_roles_on_organization_id"
  add_index "organizations_roles", ["organization_role_id", "organization_id"], :name => "by_org", :unique => true
  add_index "organizations_roles", ["organization_role_id"], :name => "index_organizations_roles_on_organization_role_id"

  create_table "parking_options", :force => true do |t|
    t.string "title",       :limit => 100, :null => false
    t.text   "description"
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
    t.string  "code"
    t.integer "city_id"
    t.integer "state_id"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "postal_code_type_id"
  end

  add_index "postal_codes", ["city_id"], :name => "index_postal_codes_on_city_id"
  add_index "postal_codes", ["code"], :name => "index_postal_codes_on_code", :unique => true
  add_index "postal_codes", ["state_id"], :name => "index_postal_codes_on_state_id"

  create_table "registrations", :force => true do |t|
    t.string   "login",         :null => false
    t.string   "first_name",    :null => false
    t.string   "last_name",     :null => false
    t.string   "email_address", :null => false
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_regions", :force => true do |t|
    t.string "title", :limit => 100, :null => false
  end

  create_table "social_media_types", :force => true do |t|
    t.string "title",       :limit => 100, :null => false
    t.text   "description"
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

  create_table "venue_av_equipment_options", :force => true do |t|
    t.integer "venue_id",               :null => false
    t.integer "av_equipment_option_id", :null => false
  end

  add_index "venue_av_equipment_options", ["av_equipment_option_id"], :name => "index_venue_av_equipment_options_on_av_equipment_option_id"
  add_index "venue_av_equipment_options", ["venue_id"], :name => "index_venue_av_equipment_options_on_venue_id"

  create_table "venue_fee_options", :force => true do |t|
    t.integer "venue_id",      :null => false
    t.integer "fee_option_id", :null => false
  end

  add_index "venue_fee_options", ["fee_option_id"], :name => "index_venue_fee_options_on_fee_option_id"
  add_index "venue_fee_options", ["venue_id"], :name => "index_venue_fee_options_on_venue_id"

  create_table "venue_food_service_options", :force => true do |t|
    t.integer "venue_id"
    t.integer "food_service_option_id"
  end

  create_table "venue_notes", :force => true do |t|
    t.integer  "venue_id",   :null => false
    t.text     "note",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venue_notes", ["venue_id"], :name => "index_venue_notes_on_venue_id"

  create_table "venue_parking_options", :force => true do |t|
    t.integer "venue_id",          :null => false
    t.integer "parking_option_id", :null => false
  end

  add_index "venue_parking_options", ["parking_option_id"], :name => "index_venue_parking_options_on_parking_option_id"
  add_index "venue_parking_options", ["venue_id"], :name => "index_venue_parking_options_on_venue_id"

  create_table "venue_types", :force => true do |t|
    t.string "title",       :limit => 50, :null => false
    t.text   "description"
  end

  create_table "venues", :force => true do |t|
    t.string   "title",                                  :null => false
    t.string   "url_friendly",                           :null => false
    t.integer  "venue_type_id",                          :null => false
    t.integer  "capacity",            :default => 0
    t.integer  "full_capacity",       :default => 0
    t.boolean  "has_internet",        :default => false
    t.boolean  "is_blacklisted",      :default => false
    t.text     "blacklist_note"
    t.string   "avatar_file_name"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["url_friendly"], :name => "index_venues_on_url_friendly", :unique => true
  add_index "venues", ["venue_type_id"], :name => "index_venues_on_venue_type_id"

end
