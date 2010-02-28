class CreateAvEquipmentOptions < ActiveRecord::Migration
  def self.up
    create_table :av_equipment_options do |t|
      t.string :title, :null => false, :limit => 100
    end
  end

  def self.down
    drop_table :av_equipment_options
  end
end