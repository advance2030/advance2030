class CreateServiceRegions < ActiveRecord::Migration
  def self.up
    create_table :service_regions do |t|
      t.string :title, :null => false, :limit => 100
    end
  end

  def self.down
    drop_table :service_regions
  end
end