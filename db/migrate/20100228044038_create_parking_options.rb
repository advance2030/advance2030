class CreateParkingOptions < ActiveRecord::Migration
  def self.up
    create_table :parking_options do |t|
      t.string :title, :null => false, :limit => 100
      t.text :description
    end
  end

  def self.down
    drop_table :parking_options
  end
end