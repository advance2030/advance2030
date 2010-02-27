class Import::Account
  def initialize(attrs={})
    @attributes = attrs
  end
  
  def username
    @username ||= @attributes[:username]
  end
  
  def password
    @password ||= @attributes[:password]
  end
  
  def joined_at
    @joined_at ||= @attributes[:joined_at]
  end
  
  def expired_at
    @expired_at ||= @attributes[:expired_at]
  end
  
  def status
    @status ||= @attributes[:status]
  end
  
  def status?
    !self.status.code.blank?
  end
  
  def active?
    self.status? && self.status.active?
  end
  
  def expired_at?
    !self.expired_at.blank?
  end
  
  def allowed_membership_range
    (Time.now.to_date - 2.months)..(Time.now.to_date + 2.months)
  end
  
  def active_by_date?
    if self.expired_at? then self.allowed_membership_range.include?(self.expired_at.to_date) else true end
  end
end