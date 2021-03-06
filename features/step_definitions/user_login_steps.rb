Given /^the following user records in the data store$/ do |table|
  create_users(table, true)
end

Given /^the following inactive user records in the data store$/ do |table|
  create_users(table, false)
end

def create_users(table, active)
  registration_converter = ConvertsRegistrationToAccountInformation.new
  table.hashes.each do |hash|
    registration = Registration.new(hash)
    registration.password_confirmation = hash["password"]

    # add address info
    user_address = Factory(:user_address)
    registration.address = user_address.address
    registration.address2 = user_address.address2
    registration.city = user_address.city
    registration.state = user_address.state_code
    registration.zip = user_address.zip

    registration_converter.do_it(registration)
    # Activate the account for now...
    account = Account.find_by_login(hash["login"])
    account.active = active
    account.save!
  end
end

