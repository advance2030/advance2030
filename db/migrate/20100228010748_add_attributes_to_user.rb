class AddAttributesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :surname_id, :integer
    add_column :users, :suffix_id, :integer
    add_column :users, :gender, :string
  end

  def self.down
    remove_column :users, :gender
    remove_column :users, :suffix_id
    remove_column :users, :surname_id
  end
end
