Feature: Creating Events
	In order to inform members of upcoming events
	As an admin
	I want to be able to add events to the site.
	
  Scenario: Visitor tries to access events/new page
	Given I am not currently logged in
	When I go to the events/new page
	Then I should be redirected to the login screen
	
  Scenario: Member tries to access events/new page
	Given I am logged in as a member
	When I go to the events/new page
	Then I should see "Access Denied"
	
  Scenario: Admin tries to access events/new page
	Given I am logged in as an Admin
	When I go to the events/new page
	Then I should see a form for creating a new event
	
