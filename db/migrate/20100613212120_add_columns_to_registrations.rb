class AddColumnsToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :address, :string
    add_column :registrations, :address2, :string
    add_column :registrations, :city, :string
    add_column :registrations, :state, :string
    add_column :registrations, :zip, :string
    add_column :registrations, :phone_number, :string
    add_column :registrations, :profession, :string
    add_column :registrations, :employer, :string
    add_column :registrations, :education, :string
    add_column :registrations, :about2030, :text
  end

  def self.down
    remove_column :registrations, :about2030
    remove_column :registrations, :education
    remove_column :registrations, :employer
    remove_column :registrations, :profession
    remove_column :registrations, :phone_number
    remove_column :registrations, :zip
    remove_column :registrations, :state
    remove_column :registrations, :city
    remove_column :registrations, :address2
    remove_column :registrations, :address
  end
end
