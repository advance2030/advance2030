module Import::Ext::String
  def to_attribute
    self.downcase.to_sym
  end
end