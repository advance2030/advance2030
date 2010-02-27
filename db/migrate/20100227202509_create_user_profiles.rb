class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.integer :user_id
      t.date :birthdate
      t.text :bio

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
