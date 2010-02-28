class CreateOrganizationsRoles < ActiveRecord::Migration
  def self.up
    create_table :organizations_roles do |t|
      t.integer :organization_role_id, :null => false
      t.integer :organization_id, :null => false
    end
    
    add_index :organizations_roles, :organization_role_id
    add_index :organizations_roles, :organization_id
    add_index :organizations_roles, [:organization_role_id, :organization_id], :unique => true, :name => 'by_org'
  end

  def self.down
    drop_table :organizations_roles
  end
end
