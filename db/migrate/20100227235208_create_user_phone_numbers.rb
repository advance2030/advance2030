class CreateUserPhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :user_phone_numbers do |t|
      t.integer :user_id, :null => false
      t.integer :phone_number_type_id, :null => false
      t.string :number, :null => false
      t.integer :sort_order
      t.timestamps
    end
  end

  def self.down
    drop_table :user_phone_numbers
  end
end