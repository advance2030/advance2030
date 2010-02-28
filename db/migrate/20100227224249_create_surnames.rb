class CreateSurnames < ActiveRecord::Migration
  def self.up
    create_table :surnames do |t|
      t.string :title, :null => false, :limit => 15
    end
    
    add_index :surnames, :title, :unique => true
  end

  def self.down
    drop_table :surnames
  end
end
