Feature: Home page
  In order to allow users to participate in Advance2030
  As a internet user
  I want be able to view a home page

  Scenario: Login link displayed on home page
    Given there are no users in the database
    When I go to the home page
    Then I should see a link with the text "Login"

  Scenario: Menu links displayed on home page
    Given there are no users in the database
    When I go to the home page
    Then I should see a link with the text "Home"
     And I should see a link with the text "Calendar Event"
     And I should see a link with the text "20/30 Members"
     And I should see a link with the text "Cleveland Plus"
     And I should see a link with the text "About 20/30"

  Scenario: Membership links displayed on homepage
    Given there are no users in the database
    When I go to the home page
    Then I should see a link with the text "Become A Member"
     And I should see a link with the text "Renew Membership"

  Scenario: Sponsored events are visible
    Given there are no users in the database
    When I go to the home page
    Then I should see "Sponsored Events"

  Scenario: Upcoming events are visible
    Given there are no users in the database
    When I go to the home page
    Then I should see "Upcoming Events"

