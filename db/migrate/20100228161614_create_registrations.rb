class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string    :login,               :null => false                # optional, you can use email instead, or both
      t.string    :first_name,          :null => false
      t.string    :last_name,           :null => false
      t.string    :email_address,       :null => false
      t.references :account
      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
