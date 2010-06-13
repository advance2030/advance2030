Given /^I passed the first step of registration$/ do
  pending
  visit(new_registration_path)
  fill_in('First name', :with => 'John')
  fill_in('Last name', :with => 'Doe')
  fill_in('Email address', :with => 'jdoe@gmail.com')
  fill_in('Login', :with => 'jdoe')
  fill_in('Password', :with => 'password')
  fill_in('Verify password', :with => 'password')
  click_button('Continue')
  # puts page.source
end

Then /^I should have one user with first name "([^\"]*)"$/ do |first_name|
  User.find_by_first_name(first_name).should_not be_nil
end

Then /^I should have one account with the login "([^\"]*)"$/ do |login|
  Account.find_by_login(login).should_not be_nil
end
