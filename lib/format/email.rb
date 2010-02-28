class Format::Email
  VALID_FORMAT = /^(([^<>()\[\]\\.,;:\s@\"]+(\.[^<>()\[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[(2([0-4]\d|5[0-5])|1?\d{1,2})(\.(2([0-4]\d|5[0-5])|1?\d{1,2})){3} \])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  
  def initialize(options = {})
    options.symbolize_keys!
    options.assert_valid_keys(:email_address)
    @attributes = options
  end
  
  class << self    
    def valid?(email_address)
      !email_address.match(self::VALID_FORMAT).blank?
    end
  end
  
  def id
    self.email_address
  end
  
  def email_address
    @attributes[:email_address]
  end
  
  def valid?
    self.class.valid?(self.email_address)
  end
end