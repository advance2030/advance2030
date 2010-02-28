class CreateFoodServiceOptions < ActiveRecord::Migration
  def self.up
    create_table :food_service_options do |t|
      t.string :title, :null => false, :limit => 100 
      t.text :description
    end
  end

  def self.down
    drop_table :food_service_options
  end
end
