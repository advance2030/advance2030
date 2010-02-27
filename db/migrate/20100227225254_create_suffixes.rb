class CreateSuffixes < ActiveRecord::Migration
  def self.up
    create_table :suffixes do |t|
      t.string :title, :null => false, :limit => 20
    end
    
    add_index :suffixes, :title, :unique => true
  end

  def self.down
    drop_table :suffixes
  end
end
