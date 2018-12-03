Feature: Use the show page
  
  As a user
  So that I can converse with the bot
  I want to enter text, see the text displayed, and see a response with the different interactable groups
  
Background: 
  Given I am on the "1" detail page
  And I fill in "name" with "Jane Doe"
  And I press "Start"
  
Scenario: See the scnerio name
  Then I should see "Scenario: Water Boiling"
    
Scenario: See the scnerio description
  Then I should see "You are a member of a team"
  
Scenario: See the default group
  Then I should see "Village Group A"
  
Scenario: See the my name
  Then I should see "Jane Doe"
  
Scenario: Initial conversation
  When I fill in "user_question" with "Hello"
  And I press "Submit"
  Then I should see "Hello"
  And I should see "Hello there"
  
Scenario: Change group
  When I press "Village Group B"
  Then I should see "Village Group B"
  When I press "Village Group C"
  Then I should see "Village Group C"
  When I press "Village Group A"
  Then I should see "Village Group A"
  
Scenario: Different group outputs
  When I fill in "user_question" with "Hello"
  And I press "Submit"
  Then I should see "Hello"
  And I should see "Hello there"
  When I press "Village Group C"
  Then I fill in "user_question" with "Hello"
  And I press "Submit"
  Then I should see "Hello"
  And I should see "Welcome we were waiting for you"
  
Scenario: Lower group standing
  When I fill in "user_question" with "Dirty water"
  And I press "Submit"
  Then I should see "94.5"
  
Scenario: Restart the game
   When I follow "Restart Game"
   Then I should be on the "1" detail page
  