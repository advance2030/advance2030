class CreateVenueTypes < ActiveRecord::Migration
  def self.up
    create_table :venue_types do |t|
      t.string :title, :null => false, :limit => 50
      t.text :description
    end
  end

  def self.down
    drop_table :venue_types
  end
end