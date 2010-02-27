class AddJoinedAndExpiredDatesToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :joined_at, :datetime
    add_column :accounts, :expired_at, :datetime
  end

  def self.down
    remove_column :accounts, :joined_at
    remove_column :accounts, :expired_at
  end
end