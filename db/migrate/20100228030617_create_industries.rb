class CreateIndustries < ActiveRecord::Migration
  def self.up
    create_table :industries do |t|
      t.string :title, :null => false, :limit => 100
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :industries
  end
end