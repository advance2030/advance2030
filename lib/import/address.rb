class Import::Address
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
  
  def street
    @street ||= @attributes[:street]
  end
  
  def street_secondary
    @street_secondary ||= @attributes[:street_secondary]
  end
  
  def formatted_street
    ('%s %s' % [self.street, self.street_secondary]).strip.squeeze
  end
  
  def city
    @city ||= @attributes[:city]
  end
  
  def state
    @state ||= @attributes[:state]
  end
  
  def postal_code
    @postal_code ||= @attributes[:postal_code]
  end
  
  def blank?
    false
  end
  
  def to_s
    ("%s %s %s %s" % [self.formatted_street, self.city.to_s, self.state.to_s, self.postal_code.to_s]).strip.squeeze
  end
end