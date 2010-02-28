class CreateEventNotes < ActiveRecord::Migration
  def self.up
    create_table :event_notes do |t|
      t.integer :event_id, :null => false
      t.text :note, :null => false
      t.timestamps
    end
    
    add_index :event_notes, :event_id
  end

  def self.down
    drop_table :event_notes
  end
end