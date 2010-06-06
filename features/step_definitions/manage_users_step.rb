Then /^I should have one user with first name "([^\"]*)"$/ do |first_name|
  User.find_by_first_name(first_name).should_not be_nil
end

Then /^I should have one account with the login "([^\"]*)"$/ do |login|
  Account.find_by_login(login).should_not be_nil
end
