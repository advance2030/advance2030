class CreateVenueAvEquipmentOptions < ActiveRecord::Migration
  def self.up
    create_table :venue_av_equipment_options do |t|
      t.integer :venue_id, :null => false
      t.integer :av_equipment_option_id, :null => false
    end

    add_index :venue_av_equipment_options, :venue_id
    add_index :venue_av_equipment_options, :av_equipment_option_id
    #add_index :venue_av_equipment_options, [:venue_id, :av_equipment_option_id], :unique => true, :name => 'by_venue'
  end

  def self.down
    drop_table :venue_av_equipment_options
  end
end
