class CreateVenueNotes < ActiveRecord::Migration
  def self.up
    create_table :venue_notes do |t|
      t.integer :venue_id, :null => false
      t.text :note, :null => false
      t.timestamps
    end
    
    add_index :venue_notes, :venue_id
  end

  def self.down
    drop_table :venue_notes
  end
end
