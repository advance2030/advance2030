class Import::Title
  def initialize(attrs={})
    @attributes = attrs
  end
  
  def title
    @title ||= @attributes[:title]
  end
  
  def to_s
    self.title
  end
end