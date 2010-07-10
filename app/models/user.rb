require 'lib/helper/string'
require 'is_taggable'

class User < ActiveRecord::Base
  has_many :email_addresses
  has_many :users_roles
  has_many :roles, :through => :users_roles
  has_one :account
  has_one :user_profile
  has_one :avatar_file_name, :through => :user_profile
  has_one :user_address
  
  named_scope :all_members
  #named_scope :all_members, :order => :created_at
  named_scope :active, :joins => :account, :conditions => ['accounts.active = ?', true]
	
	def before_save
    self.url_friendly = self.display_name.extend(Helper::String).to_url_friendly unless self.url_friendly?
  end
	
  def to_param
    self.url_friendly
  end
	
	def display_name
    "#{first_name} #{last_name}"
  end

	def login
    account.login
  end
  
  def active
    account.active
  end
  
  
end  

=begin  
  has_many :email_addresses
  has_many :users_roles
  has_many :roles, :through => :users_roles
  has_one :account
  has_one :user_profile
  has_one :user_address

  named_scope :managers, lambda {{
    :joins => :users_roles,
    :conditions => ["users_roles.user_role_id = ?", UserRole.event_manager]
  }}

  named_scope :supervisors, lambda {{
    :joins => :users_roles,
    :conditions => ["users_roles.user_role_id = ?", UserRole.event_supervisor]
  }}

  def display_name
    "#{first_name} #{last_name}"
  end

  def login
    account.login
  end
	
	

=end

