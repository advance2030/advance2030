class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name, :null => false
      t.string :url_friendly, :null => false
      t.text :summary
      t.text :description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.datetime :registration_start_datetime
      t.datetime :registration_end_datetime
      t.integer :attendee_target_count
      t.integer :attendee_limit
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end