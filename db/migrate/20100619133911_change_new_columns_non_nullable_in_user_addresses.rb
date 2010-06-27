class ChangeNewColumnsNonNullableInUserAddresses < ActiveRecord::Migration
  def self.up
    change_column :user_addresses, :address, :string, :null => false
    change_column :user_addresses, :city, :string, :null => false
    change_column :user_addresses, :state_code, :string, :null => false
    change_column :user_addresses, :zip, :string, :null => false
  end

  def self.down
    change_column :user_addresses, :address, :string, :null => true
    change_column :user_addresses, :city, :string, :null => true
    change_column :user_addresses, :state_code, :string, :null => true
    change_column :user_addresses, :zip, :string, :null => true
  end
end

