class User < ActiveRecord::Base
  has_many :email_addresses
  has_one :account
  has_one :user_profile
end
