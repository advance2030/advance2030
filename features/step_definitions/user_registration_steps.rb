Given /^I passed the first step of registration$/ do
  # #pending
  registration = Factory.build(:registration)
  visit(new_registration_path)
  fill_in('First name', :with => registration.first_name)
  fill_in('Last name', :with => registration.last_name)
  fill_in('Email address', :with => registration.email_address)
  fill_in('Login', :with => registration.login)
  fill_in('Password', :with => registration.password)
  fill_in('Verify password', :with => registration.password_confirmation)
  click_button('Continue')
  # puts page.source
end

Then /^I should have one user with first name "([^\"]*)"$/ do |first_name|
  User.find_by_first_name(first_name).should_not be_nil
end

Then /^I should have one account with the login "([^\"]*)"$/ do |login|
  Account.find_by_login(login).should_not be_nil
end

Then /^I should see the Paypal button$/ do
  page.should have_xpath('//input[@type="image" and @src="images/paypal.gif"]')
end

