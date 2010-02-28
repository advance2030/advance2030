class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name, :null => false
      t.string :legal_name
      t.string :dba
      t.string :tax_identification
      t.integer :user_id
      t.integer :service_region_id, :null => false
      t.integer :organization_type_id, :null => false
      t.text :mission
      t.integer :local_staff_size
      t.integer :total_staff_size
      t.float :annual_revenue
      t.string :logo_file_name
      t.integer :logo_file_size
      t.string :logo_content_type
      t.datetime :logo_updated_at
      t.timestamps
    end
    
    add_index :organizations, :user_id
    add_index :organizations, :service_region_id
    add_index :organizations, :organization_type_id
  end

  def self.down
    drop_table :organizations
  end
end
