Feature: Manage Users
  In order to access the full site
  As a user
  I want be able to register and log on to the site

  Scenario: All fields should be validated
    Given there are no users in the database
      And I go to the user registration page
    When I press "Register"
    Then I should see "Login can't be blank"
     And I should see "First name can't be blank"
     And I should see "Last name can't be blank"
     And I should see "Email address can't be blank"
     And I should see "Password can't be blank"
     And I should see "Password confirmation can't be blank"

  Scenario: Password and Password confirmation should match
    Given there are no users in the database
      And I go to the user registration page
      And I fill in "First name" with "John"
      And I fill in "Last name" with "Doe"
      And I fill in "Email address" with "jdoe@gmail.com"
      And I fill in "Login" with "jdoe"
      And I fill in "Password" with "password"
      And I fill in "Verify password" with "password1"
    When I press "Register"
    Then I should not see "First name can't be blank"
     And I should see "Password and confirmation do not match"

  Scenario: User should be successfully registered
    Given there are no users in the database
      And I go to the user registration page
      And I fill in "First name" with "John"
      And I fill in "Last name" with "Doe"
      And I fill in "Email address" with "jdoe@gmail.com"
      And I fill in "Login" with "jdoe"
      And I fill in "Password" with "password"
      And I fill in "Verify password" with "password"
    When I press "Register"
    Then I should see "hello"
     And I should have one user with first name "John"
