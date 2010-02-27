class Import::PhoneNumber
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
  
  def number
    @number ||= @attributes[:number]
  end
  
  def formatted_number
    self.number #TODO: parse phone number formats
  end
  
  def blank?
    self.number.blank?
  end
  
  def to_s
    self.formatted_number
  end
end