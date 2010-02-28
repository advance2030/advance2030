class CreateVenueAvEquipments < ActiveRecord::Migration
  def self.up
    create_table :venue_av_equipments do |t|
      t.integer :venue_id, :null => false
      t.integer :av_equipment_id, :null => false
    end
    
    add_index :venue_av_equipments, :venue_id
    add_index :venue_av_equipments, :av_equipment_id
    add_index :venue_av_equipments, [:venue_id, :av_equipment_id], :unique => true, :name => 'by_venue'
  end

  def self.down
    drop_table :venue_av_equipments
  end
end