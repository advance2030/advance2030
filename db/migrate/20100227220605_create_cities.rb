class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :title, :null => false, :limit => 75
      t.string :url_friendly, :null => false, :limit => 75
    end
    
    add_index :cities, :title, :unique => true
    add_index :cities, :url_friendly, :unique => true
  end

  def self.down
    drop_table :cities
  end
end
