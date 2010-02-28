class CreateOrganizationRoles < ActiveRecord::Migration
  def self.up
    create_table :organization_roles do |t|
      t.string :role, :null => false, :limit => 50
      t.text :description
    end
    
    add_index :organization_roles, :role, :unique => true
  end

  def self.down
    drop_table :organization_roles
  end
end