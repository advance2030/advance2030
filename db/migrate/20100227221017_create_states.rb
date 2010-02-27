class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :title, :null => false, :limit => 50
      t.string :code, :null => false, :limit => 10
    end
    
    add_index :states, :title, :unique => true
    add_index :states, :code, :unique => true
  end

  def self.down
    drop_table :states
  end
end