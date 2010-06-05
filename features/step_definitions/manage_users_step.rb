When /^I press the "Register" button$/ do
  pending #just for now
end

Then /^I should have one user with first name "([^\"]*)"$/ do |first_name|
  User.find_by_first_name(first_name).should_not be_nil
end

