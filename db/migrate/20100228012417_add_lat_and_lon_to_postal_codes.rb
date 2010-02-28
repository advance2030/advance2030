class AddLatAndLonToPostalCodes < ActiveRecord::Migration
  def self.up
    add_column :postal_codes, :latitude, :float
    add_column :postal_codes, :longitude, :float
    add_column :postal_codes, :postal_code_type_id, :integer
  end

  def self.down
    remove_column :postal_codes, :postal_code_type_id
    remove_column :postal_codes, :longitude
    remove_column :postal_codes, :latitude
  end
end
