class CreateVenueFeeOptions < ActiveRecord::Migration
  def self.up
    create_table :venue_fee_options do |t|
      t.integer :venue_id, :null => false
      t.integer :fee_option_id, :null => false
    end

    add_index :venue_fee_options, :venue_id
    add_index :venue_fee_options, :fee_option_id
    #add_index :venue_fee_options, [:venue_id, :fee_option_id], :unique => true, :name => 'by_venue'
  end

  def self.down
    drop_table :venue_fee_options
  end
end
