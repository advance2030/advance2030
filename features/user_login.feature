Feature: Login Users
  In order to access the full site
  As a user
  I want be able to log on to the site

  Scenario: User tries to login but login/password is not provided
    Given there are no users in the database
      And I go to the user login page
    When I press "Log In"
    Then I should see "You did not provide any details for authentication"

  Scenario: User tries to login with invalid username/password
    Given there are no users in the database
      And I go to the user login page
      And I fill in "Login" with "jdoe"
      And I fill in "Password" with "password"
    When I press "Log In"
    Then I should see "Login/Password combination is not valid"

  Scenario: User should be able to successfully log in
    Given the following user records in the data store
      | first_name | last_name | email_address | login | password | password_confirmation |
      | John | Doe | jdoe@gmail.com | jdoe | password | password |
      And I go to the user login page
      And I fill in "Login" with "jdoe"
      And I fill in "Password" with "password"
    When I press "Log In"
    Then I should see "jdoe"

  Scenario: User login name should be displayed on the home page after user logged in
    Given the following user records in the data store
      | first_name | last_name | email_address | login | password | password_confirmation |
      | Jane | Smith | jsmith@gmail.com | jsmith | password | password |
      And I am on the user login page
      And I fill in "Login" with "jsmith"
      And I fill in "Password" with "password"
      And I press "Log In"
    When I go to the home page
    Then I should see "jsmith"

