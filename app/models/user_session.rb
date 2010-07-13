class UserSession < Authlogic::Session::Base

  authenticate_with Account
  generalize_credentials_error_messages true
end

