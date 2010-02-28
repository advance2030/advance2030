class CreateVenueParkingOptions < ActiveRecord::Migration
  def self.up
    create_table :venue_parking_options do |t|
      t.integer :venue_id, :null => false
      t.integer :parking_option_id, :null => false
    end
    
    add_index :venue_parking_options, :venue_id
    add_index :venue_parking_options, :parking_option_id
    #add_index :venue_parking_options, [:venue_id, :parking_option_id], :unique => true, :name => 'by_venue'
  end

  def self.down
    drop_table :venue_parking_options
  end
end
