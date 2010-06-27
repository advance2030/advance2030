class RemovePostalCodeIdFromUserAddresses < ActiveRecord::Migration
  def self.up
    remove_column :user_addresses, :postal_code_id
  end

  def self.down
    add_column :user_addresses, :postal_code_id, :integer, :null => false
    add_index :user_addresses, :postal_code_id
  end
end

