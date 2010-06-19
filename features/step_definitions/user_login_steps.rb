Given /^the following user records in the data store$/ do |table|
  registration_converter = ConvertsRegistrationToAccountInformation.new
  table.hashes.each do |hash|
    registration = Registration.new(hash)
    registration_converter.do_it(registration)
    # Activate the account for now...
    account = Account.find_by_login(hash["login"])
    account.active = true
    account.save!
  end
end

