Feature: Use the details page
  
  As a user
  So that I can start a scenerio
  I want to be read a scenerio, eneter a name, and start the scenerio
  
Background:
  Given I am on the "1" detail page
  
Scenario: Access the detail page
  Then I should be on the "1" detail page
  
Scenario: See the details
  Then I should see "Water Boiling"
  And I should see "You are a member of a team"

Scenario: Go to show page
  And I fill in "name" with "Jane Doe"
  And I press "Start"
  Then I should be on the show page for "1"
  
Scenario: Return to homepage
  When I follow "Home Page"
  Then I should be on the home page