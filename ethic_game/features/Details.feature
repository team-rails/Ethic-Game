Feature: Use the Task description page
  
  As a user
  So that I can start an interaction
  I want to understand the task, enter a name, and start the interaction
  
Background:
  Given I am on the details page for "1"
  

#new  
Scenario: See the Title
  Then I should see "Ethics Game"
#new  
Scenario: See the Description
  Then I should see "Welcome to the Ethics role playing game"

Scenario: Go to show page
  And I fill in "name" with "Jane Doe"
  And I press "Start"
  Then I should be on the show page for "1"
  
Scenario: Return to homepage
  When I follow "Home Page"
  Then I should be on the home page