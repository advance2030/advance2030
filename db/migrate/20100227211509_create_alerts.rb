class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.string :name
      t.string :alerttext
      t.datetime :start_date_time
      t.datetime :end_date_time
      
      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
