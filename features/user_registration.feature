Feature: Register Users
  In order to access the full site
  As a user
  I want be able to register on the site

  Scenario: All fields should be validated
    Given there are no users in the database
      And I go to the user registration page
    When I press "Continue"
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
    When I press "Continue"
    Then I should not see "First name can't be blank"
     And I should see "Password and confirmation do not match"

  Scenario: User should pass the first step in Registration
    Given there are no users in the database
      And I go to the user registration page
      And I fill in "First name" with "John"
      And I fill in "Last name" with "Doe"
      And I fill in "Email address" with "jdoe@gmail.com"
      And I fill in "Login" with "jdoe"
      And I fill in "Password" with "password"
      And I fill in "Verify password" with "password"
    When I press "Continue"
    Then I should see "Personal Information"

  Scenario: All personal info is required on the second step of Registration
    Given I passed the first step of registration
     When I press "Continue"
     Then I should see "Address can't be blank"
      And I should see "City can't be blank"
      And I should see "Zip can't be blank"
      And I should see "Phone number can't be blank"
