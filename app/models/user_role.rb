class UserRole < ActiveRecord::Base

  def self.event_manager; UserRole.find_by_role("Event Manager") end
  def self.event_supervisor; UserRole.find_by_role("Event Supervisor") end

end
