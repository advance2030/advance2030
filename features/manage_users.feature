Feature: Manage Users
  In order to access the full site
  As a user
  I want be able to register and log on to the site

  Scenario: Login and Password should be validated
    Given there are no users in the database
      And I go to the user registration page
    When I press the "Register" button
    Then I'd like to see the error message "Login is too short"
     And I should see the error message "Password is too short"
