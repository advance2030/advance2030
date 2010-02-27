class Import::PostalCode
  def initialize(attrs={})
    @attributes = attrs
  end
  
  class << self
    def all
      ImportMembers.new.postal_codes
    end
  end
  
  def code
    @code ||= @attributes[:code]
  end
  
  def to_s
    self.code
  end
end