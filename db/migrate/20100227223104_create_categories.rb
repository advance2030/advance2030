class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :limit => 20, :null => false
      t.string :description, :null => false
    end

    add_index :categories, :name, :unique => true
  end

  def self.down
    drop_table :categories
  end
end
