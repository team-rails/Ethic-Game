Feature: check for home page
  
  As a user
  So that I can use the web app
  I want to be able to access the home page
  
Background: nothing
    
Scenario: open the home page
  Given I am on the home page
  Then I should be on the home page
  
    
Scenario: see test scenario on  scenario page
  Given I am on the home page
  Then I should see "Test Scenario"
  
Scenario: See scenario name on detail page
    Given I am on the home page
    And I go to the "Test Scenario" detail page
    Then I should see "Test Scenario"
    
Scenario: See scenario name on detail page
  Given I am on the home page
  And I go to the "Water Boiling Exercise" detail page
  Then I should see "Water Boiling Exercise"
  
Scenario: See show page
  Given I am on the "Test Scenario" detail page
  And I go to the show page for "Test Scenario"
  #Then I will be on the scenario show page
  