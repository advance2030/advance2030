module RegistrationsHelper
  EMAIL_REGEX = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end

def title_string(step)
  return "Registration: Membership Dues" if step == 'review'
  "Registration"
end
