class AddColumsToEventTable < ActiveRecord::Migration
  def self.up
    add_column :events, :member_price, :decimal, :precision => 6, :scale => 2
    add_column :events, :non_member_price, :decimal, :precision => 6, :scale => 2
  end

  def self.down
    remove_column :event_tables, :non_member_price
    remove_column :event_tables, :member_price
  end
end
