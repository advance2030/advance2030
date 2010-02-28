class User < ActiveRecord::Base
  has_many :email_addresses
  has_many :users_roles
  has_many :roles, :through => :users_roles
  has_one :account
  has_one :user_profile

  named_scope :managers, lambda {{
    :joins => :users_roles,
    :conditions => ["users_roles.user_role_id = ?", UserRole.event_manager]
  }}

  def display_name
    "%s %s" % [first_name, last_name]
  end

end
