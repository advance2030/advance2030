class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :title
      t.string :url, :null => false
      t.text :description
      t.boolean :is_active, :default => true
      t.integer :hits, :default => 0
      t.timestamps
    end
    
    add_index :links, :url, :unique => true
  end

  def self.down
    drop_table :links
  end
end
