class CreateOrganizationsIndustries < ActiveRecord::Migration
  def self.up
    create_table :organizations_industries do |t|
      t.integer :organization_id, :null => false
      t.integer :industry_id, :null => false
    end
    
    add_index :organizations_industries, :organization_id
    add_index :organizations_industries, :industry_id
    add_index :organizations_industries, [:organization_id, :industry_id], :unique => true, :name => 'by_industry'
  end

  def self.down
    drop_table :organizations_industries
  end
end