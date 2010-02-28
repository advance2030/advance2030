class CreateUserRoles < ActiveRecord::Migration
  def self.up
    create_table :user_roles do |t|
      t.string :role, :null => false, :limit => 50
      t.text :description
    end
    
    add_index :user_roles, :role, :unique => true
  end

  def self.down
    drop_table :user_roles
  end
end