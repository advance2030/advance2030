class UsersRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role, :class_name => 'UserRole', :foreign_key => 'user_role_id'
end
