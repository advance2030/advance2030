class RenameStreetToAddress2InUserAddresses < ActiveRecord::Migration
  def self.up
    rename_column :user_addresses, :street, :address2
  end

  def self.down
    rename_column :user_addresses, :address2, :street
  end
end

