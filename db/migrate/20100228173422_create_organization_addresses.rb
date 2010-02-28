class CreateOrganizationAddresses < ActiveRecord::Migration
  def self.up
    create_table :organization_addresses do |t|
      t.integer :address_type_id, :null => false
      t.integer :organization_id, :null => false
      t.text :street
      t.integer :postal_code_id, :null => false
      t.boolean :is_primary
      t.integer :sort_order
      t.timestamps
    end
    
    add_index :organization_addresses, :address_type_id
    add_index :organization_addresses, :organization_id
    add_index :organization_addresses, :postal_code_id
  end

  def self.down
    drop_table :organization_addresses
  end
end
