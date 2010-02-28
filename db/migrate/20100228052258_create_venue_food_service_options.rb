class CreateVenueFoodServiceOptions < ActiveRecord::Migration
  def self.up
    create_table :venue_food_service_options do |t|
      t.integer :venue_id
      t.integer :food_service_option_id
    end
  end

  def self.down
    drop_table :venue_food_service_options
  end
end
