class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.integer :user_id, :null => false
      t.date :birthdate
      t.text :bio
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.timestamps
    end
    
    add_index :user_profiles, :user_id, :unique => true
  end

  def self.down
    drop_table :user_profiles
  end
end