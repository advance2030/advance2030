class AddEventsCategories < ActiveRecord::Migration
  def self.up
    create_table :categorizations do |t|
      t.integer :category_id, :null => false
      t.integer :item_id, :null => false
    end

    add_index(:categorizations, [:item_id, :category_id], :unique => true)
  end

  def self.down
    drop_table :categorizations
  end
end
