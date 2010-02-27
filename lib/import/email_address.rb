class Import::EmailAddress
  def initialize(attrs={})
    @attributes = attrs
  end
  
  def types
    %( home work mobile )
  end
  
  def type
    @type ||= @attributes[:type]
  end
  
  def is_primary
    @is_primary ||= @attributes[:is_primary]
  end
  
  def confirmed_at
    @confirmed_at ||= @attributes[:confirmed_at]
  end
  
  def address
    @address ||= @attributes[:address]
  end
  
  def blank?
    self.address.blank?
  end
  
  def to_s
    self.address
  end
end