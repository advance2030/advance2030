class CreateUsersRoles < ActiveRecord::Migration
  def self.up
    create_table :users_roles do |t|
      t.integer :user_id, :null => false
      t.integer :user_role_id, :null => false
    end
    
    add_index :users_roles, :user_id
    add_index :users_roles, :user_role_id
    add_index :users_roles, [:user_id, :user_role_id], :unique => true, :name => 'by_user'
  end

  def self.down
    drop_table :users_roles
  end
end