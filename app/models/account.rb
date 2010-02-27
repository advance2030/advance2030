class Account < ActiveRecord::Base

  acts_as_authentic do |c|
    c.session_class = UserSession
    c.logged_in_timeout = 4.hours
    c.validate_login_field = true
    c.validate_password_field = true
    c.perishable_token_valid_for = 5.minutes
  end   
  
end

