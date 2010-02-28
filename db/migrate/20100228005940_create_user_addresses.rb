class CreateUserAddresses < ActiveRecord::Migration
  def self.up
    create_table :user_addresses do |t|
      t.integer :user_id, :null => false
      t.text :street
      t.integer :postal_code_id, :null => false
      t.integer :address_type_id, :null => false
      t.boolean :is_primary, :default => false
      t.integer :sort_order
      t.timestamps
    end
    
    add_index :user_addresses, :user_id
    add_index :user_addresses, :postal_code_id
    add_index :user_addresses, :address_type_id
  end

  def self.down
    drop_table :user_addresses
  end
end