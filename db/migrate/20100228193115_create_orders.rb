class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :amount
      t.string :description
      t.string :state, :default => 'pending'
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
