class CreateFeeOptions < ActiveRecord::Migration
  def self.up
    create_table :fee_options do |t|
      t.string :title, :null => false, :limit => 50
      t.text :description
    end
  end

  def self.down
    drop_table :fee_options
  end
end