class CreateCommittees < ActiveRecord::Migration
  def self.up
    create_table :committees do |t|
      t.string :name, :null => false, :length => 50
      t.string :description, :null => false
      t.boolean :active
    end
    
    create_table :committee_members do |t|
      t.integer :member_id, :null => false
      t.integer :committee_id, :null => false
      t.boolean :lead, :null => false, :default => false
    end
    
    create_table :committee_posts do |t|
      t.string  :title, :null => false, :length => 100
      t.integer :user_id, :null => false
      t.string  :text, :null => false
    end
    
    create_table :committee_assets do |t|
      t.integer :asset_id, :null => false
      t.integer :committee_id, :null => false
    end
    
    create_table :committee_events do |t|
      t.integer :event_id, :null => false
      t.integer :committee_id, :null => false
    end
  
    create_table :committee_blogs do |t|
      t.string  :title, :null => false, :length => 100
      t.integer :user_id, :null => false
      t.string  :text, :null => false
    end
  end

  def self.down
    drop_table :committee_events
    drop_table :committee_assets
    drop_table :committee_posts
    drop_table :committee_members
    drop_table :committees
  end
end
