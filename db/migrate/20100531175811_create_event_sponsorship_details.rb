class CreateEventSponsorshipDetails < ActiveRecord::Migration
  def self.up
    create_table :event_sponsorship_details do |t|
      t.integer :event_id
      t.integer :organization_id
      t.text :sponsorship_summary

      t.timestamps
    end
  end

  def self.down
    drop_table :event_sponsorship_details
  end
end
