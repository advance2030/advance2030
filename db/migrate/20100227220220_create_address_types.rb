class CreateAddressTypes < ActiveRecord::Migration
  def self.up
    create_table :address_types do |t|
      t.string :title, :null => false, :limit => 50
      t.text :description
    end
    
    add_index :address_types, :title, :unique => true
  end

  def self.down
    drop_table :address_types
  end
end