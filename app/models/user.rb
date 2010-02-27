class User < ActiveRecord::Base
  has_many :email_addresses
end
