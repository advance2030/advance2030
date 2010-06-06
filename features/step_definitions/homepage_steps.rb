Given /^there are no users in the database$/ do
  UserProfile.delete_all
  Account.delete_all
  User.delete_all
end

