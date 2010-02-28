class CreatePostalCodeTypes < ActiveRecord::Migration
  def self.up
    create_table :postal_code_types do |t|
      t.string :title, :null => false, :limit => 50
      t.string :url_friendly, :null => false, :limit => 50 
      t.timestamps
    end
    
    add_index :postal_code_types, :url_friendly, :unique => true
  end

  def self.down
    drop_table :postal_code_types
  end
end