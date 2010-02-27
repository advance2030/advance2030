class Import::Member
  def initialize(attrs={})
    @attributes = attrs
  end
  
  def title
    @title ||= @attributes[:title]
  end
  
  def first_name
    @first_name ||= @attributes[:first_name]
  end
  
  def middle_name
    @middle_name ||= @attributes[:middle_name]
  end
  
  def last_name
    @last_name ||= @attributes[:last_name]
  end
  
  def suffix
    @suffix ||= @attributes[:suffix]
  end
  
  def birthdate
    @birthdate ||= (@attributes[:birthdate].to_date || nil)
  end
  
  def gender
    @gender ||= @attributes[:gender]
  end
  
  def gender?
    !self.gender.blank?
  end
  
  def male?
    'M' == self.gender
  end
  
  def female?
    'F' == self.gender
  end
  
  def formatted_gender
    if self.male? then 'Male' else 'Female' end
  end
  
  def full_name
    @full_name ||= ("%s %s %s %s" % [self.title.to_s, self.first_name, self.last_name, self.suffix.to_s]).strip.squeeze
  end
  
  def addresses
    @addresses ||= @attributes[:addresses].reject(&:blank?)
  end
  
  def addresses?
    self.addresses.any?
  end
  
  def phone_numbers
    @phone_numbers ||= @attributes[:phone_numbers].reject(&:blank?)
  end
  
  def phone_numbers?
    self.phone_numbers.any?
  end
  
  def email_addresses
    @email_addresses ||= @attributes[:email_addresses].reject(&:blank?)
  end
  
  def email_addresses?
    self.email_addresses.any?
  end
  
  def account
    @account ||= @attributes[:account]
  end
  
  def company
    @company ||= @attributes[:company] unless @attributes[:company].blank?
  end
  
  def company?
    !self.company.blank?
  end
end