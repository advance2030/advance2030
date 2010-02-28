class CreatePostalCodes < ActiveRecord::Migration
  def self.up
    create_table :postal_codes do |t|
      t.string :code
      t.integer :city_id
      t.integer :state_id
    end
    
    add_index :postal_codes, :code, :unique => true
    add_index :postal_codes, :city_id
    add_index :postal_codes, :state_id
  end

  def self.down
    drop_table :postal_codes
  end
end