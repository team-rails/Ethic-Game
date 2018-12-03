Feature: check for home page
  
  As a user
  So that I can use the web app
  I want to be able to access the home page
  
Background: nothing
    
Scenario: Open the home page
  Given I am on the home page
  Then I should be on the home page
  
Scenario: See test scenario on scenario page
  Given I am on the home page
  Then I should see "Water Boiling"
  
Scenario: Go to scenerio detail page
    Given I am on the home page
    And I go to the "1" detail page
    Then I should see "Water Boiling"
  