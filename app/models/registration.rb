class Registration < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessor :password_confirmation
  
  belongs_to :account
  
end
