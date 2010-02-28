class AddForeignKeysToEvents < ActiveRecord::Migration
  def self.up
    alter_table :events do |t|
      t.integer :venue_id
      t.integer :manager_id
      t.integer :supervisor_id
      t.integer :committee_id
    end
  end

  def self.down
  end
end
