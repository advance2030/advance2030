Feature: Manage Users
  In order to access the full site
  As a user
  I want be able to register and log on to the site

  Scenario: Login and Password should be validated
    Given there are no users in the database
      And I go to the user registration page
    When I press "Register"
    Then I should see "Login can't be blank"
     And I should see "First name can't be blank"
     And I should see "Last name can't be blank"
     And I should see "Email address can't be blank"
