class AddMissingColumnsToUserAddresses < ActiveRecord::Migration
  def self.up
    add_column :user_addresses, :address, :string
    add_column :user_addresses, :city, :string
    add_column :user_addresses, :state_code, :string
    add_column :user_addresses, :zip, :string
  end

  def self.down
    remove_column :user_addresses, :address
    remove_column :user_addresses, :city
    remove_column :user_addresses, :state_code
    remove_column :user_addresses, :zip
  end
end

