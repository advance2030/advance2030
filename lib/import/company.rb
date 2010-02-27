class Import::Company
  def initialize(attrs={})
    @attributes = attrs
  end
  
  class << self
    def all
      ImportMembers.new.companies
    end
  end
  
  def name
    @name ||= @attributes[:name]
  end
  
  def blank?
    self.name.blank?
  end
  
  def to_s
    self.name
  end
end