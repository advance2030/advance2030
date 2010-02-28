class CreateOrganizationPhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :organization_phone_numbers do |t|
      t.integer :phone_number_type_id, :null => false
      t.integer :organization_id, :null => false
      t.string :number, :null => false
      t.boolean :is_primary
      t.integer :sort_order
      t.timestamps
    end
    
    add_index :organization_phone_numbers, :phone_number_type_id
    add_index :organization_phone_numbers, :organization_id
  end

  def self.down
    drop_table :organization_phone_numbers
  end
end
