class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :summary
      t.text :description
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.datetime :registration_start_date_time
      t.datetime :registration_end_date_time
      t.integer :attendee_target_count
      t.integer :attendee_limit
      t.text :notes
      t.text :venue_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
