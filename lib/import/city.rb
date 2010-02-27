class Import::City
  def initialize(attrs={})
    @attributes = attrs
  end
  
  class << self
    def all
      ImportMembers.new.cities
    end
  end
  
  def name
    @name ||= @attributes[:name]
  end
  
  def to_s
    self.name
  end
end