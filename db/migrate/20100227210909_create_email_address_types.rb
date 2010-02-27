class CreateEmailAddressTypes < ActiveRecord::Migration
  def self.up
    create_table :email_address_types do |t|
      t.string :title, :null => false, :limit => 50
      t.text :description
    end
    
    add_index :email_address_types, :title, :unique => true
  end

  def self.down
    drop_table :email_address_types
  end
end