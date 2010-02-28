class CreateEmailAddresses < ActiveRecord::Migration
  def self.up
    create_table :email_addresses do |t|
      t.string :address
      t.references :user
      t.references :email_address_type
      t.boolean :primary, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :email_addresses
  end
end