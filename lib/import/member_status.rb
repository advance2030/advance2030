class Import::MemberStatus
  def initialize(attrs={})
    @attributes = attrs
  end
  
  class << self
    def all
      ImportMembers.new.member_statuses
    end
  end
  
  def code
    @code ||= @attributes[:code]
  end
  
  def description
    @description ||= @attributes[:description]
  end
  
  def active?
    'active' == self.code.downcase
  end
  
  def inactive?
    'inactive' == self.code.downcase
  end
  
  def on_hold?
    'onhold' == self.code.downcase
  end
  
  def subscriber?
    'subscriber' == self.code.downcase
  end
  
  def nonmember?
    'nonmemr' == self.code.downcase
  end
  
  def nonmember_customer?
    'nonmemc' == self.code.downcase
  end
  
  def do_not_contact?
    'donotcont' == self.code.downcase
  end
  
  def blank?
    self.code.blank?
  end
  
  def to_s
    ("%s (%s)" % [self.code, self.description]).strip.squeeze
  end
end