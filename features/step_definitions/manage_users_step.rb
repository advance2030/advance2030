Given /^the following user records in the data store$/ do |table|
  registration_converter = ConvertsRegistrationToAccountInformation.new
  table.hashes.each do |hash|
    registration = Registration.new(hash)
    registration_converter.do_it(registration)
  end

  # table is a Cucumber::Ast::Table
  # pending # express the regexp above with the code you wish you had
end

Then /^I should have one user with first name "([^\"]*)"$/ do |first_name|
  User.find_by_first_name(first_name).should_not be_nil
end

Then /^I should have one account with the login "([^\"]*)"$/ do |login|
  Account.find_by_login(login).should_not be_nil
end
