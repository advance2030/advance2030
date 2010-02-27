class CreatePhoneNumberTypes < ActiveRecord::Migration
  def self.up
    create_table :phone_number_types do |t|
      t.string :title, :null => false, :length => 50
      t.text :description
    end
    
    add_index :phone_number_types, :title, :unique => true
  end

  def self.down
    drop_table :phone_number_types
  end
end