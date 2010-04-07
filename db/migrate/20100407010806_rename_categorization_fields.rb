class RenameCategorizationFields < ActiveRecord::Migration
  def self.up
    remove_index(:categorizations, :column => [:item_id, :category_id])
    rename_column :categorizations, :item_id, :event_id
    add_index(:categorizations, [:event_id, :category_id], :unique => true)
  end

  def self.down
    remove_index(:categorizations, :column => [:event_id, :category_id])
    rename_column :categorizations, :event_id, :item_id
    add_index(:categorizations, [:item_id, :category_id], :unique => true)
  end
end
