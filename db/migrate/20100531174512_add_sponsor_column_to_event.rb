class AddSponsorColumnToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :sponsor, :boolean
  end

  def self.down
    remove_column :events, :sponsor
  end
end
