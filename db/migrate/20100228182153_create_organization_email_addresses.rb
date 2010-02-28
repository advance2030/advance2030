class CreateOrganizationEmailAddresses < ActiveRecord::Migration
  def self.up
    create_table :organization_email_addresses do |t|
      t.integer :email_address_type_id, :null => false
      t.integer :organization_id, :null => false
      t.string :address, :null => false
      t.boolean :is_primary
      t.boolean :is_confirmed
      t.integer :sort_order
      t.timestamps
    end
    
    add_index :organization_email_addresses, :email_address_type_id
    add_index :organization_email_addresses, :organization_id
    add_index :organization_email_addresses, :address, :unique => true
  end

  def self.down
    drop_table :organization_email_addresses
  end
end