class UserSession < Authlogic::Session::Base
  
  authenticate_with Account
  
end