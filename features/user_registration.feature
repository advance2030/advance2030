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

  Scenario: User should be able to start over in the middle of the Registration
    Given I passed the first step of registration
     When I follow "Start Over"
     Then I should be on the user registration page

  Scenario: User should pass the second step in Registration
    Given I passed the first step of registration
      And I fill in "Address" with "243 Cedar"
      And I fill in "City" with "Mayfield Heights"
      And I select "Ohio" from "State"
      And I fill in "Zip" with "44124"
      And I fill in "Phone number" with "651-342-3987"
      And I fill in "Profession" with "plumber"
      And I fill in "Employer" with "City of Mayfield"
      And I fill in "Education" with "High School Diploma"
      And I fill in "How did you hear about Cleveland 20/30" with "Through friends"
    When I press "Continue"
     Then I should see "Registration: Membership Dues"
      And I should see the Paypal button
      And I should have a User account created

