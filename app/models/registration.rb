class Registration < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessor :password_confirmation
  
  belongs_to :account
 
  validates_presence_of :login, :first_name, :last_name, :email_address
end
