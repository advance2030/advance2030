class CreateOrganizationLinks < ActiveRecord::Migration
  def self.up
    create_table :organization_links do |t|
      t.integer :link_type_id, :null => false
      t.integer :organization_id, :null => false
      t.integer :link_id, :null => false
      t.boolean :is_primary
      t.integer :sort_order
    end
    
    add_index :organization_links, :link_type_id
    add_index :organization_links, :organization_id
    add_index :organization_links, :link_id
  end

  def self.down
    drop_table :organization_links
  end
end
