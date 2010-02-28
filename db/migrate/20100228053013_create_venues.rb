class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :title, :null => false
      t.string :url_friendly, :null => false
      t.integer :venue_type_id, :null => false
      t.integer :capacity, :default => 0
      t.integer :full_capacity, :default => 0
      t.boolean :has_internet, :default => false
      t.boolean :is_blacklisted, :default => false
      t.text :blacklist_note
      t.string :avatar_file_name
      t.integer :avatar_file_size
      t.string :avatar_content_type
      t.datetime :avatar_updated_at
      t.timestamps
    end

    add_index :venues, :url_friendly, :unique => true
    add_index :venues, :venue_type_id
  end

  def self.down
    drop_table :venues
  end
end
