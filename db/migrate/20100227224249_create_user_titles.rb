class CreateUserTitles < ActiveRecord::Migration
  def self.up
    create_table :user_titles do |t|
      t.string :title, :null => false, :limit => 15
    end
    
    add_index :user_titles, :title, :unique => true
  end

  def self.down
    drop_table :user_titles
  end
end
