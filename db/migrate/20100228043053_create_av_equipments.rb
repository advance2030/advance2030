class CreateAvEquipments < ActiveRecord::Migration
  def self.up
    create_table :av_equipments do |t|
      t.string :title, :null => false, :limit => 100
    end
  end

  def self.down
    drop_table :av_equipments
  end
end