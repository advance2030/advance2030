class Registration < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessor :password_confirmation
  
  belongs_to :account
 
  validates_presence_of :login, :first_name, :last_name, :email_address, :password, :password_confirmation
  validates_format_of :email_address,
    :with => RegistrationsHelper::EMAIL_REGEX,
    :if => :email_address?
end
