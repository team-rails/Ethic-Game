Feature: check for home page
  
  As a user
  So that I can use the web app
  I want to be able to access the home page
  
Background:
  Given I am on the home page
    
#Scenario: Open the home page
#  Given I am on the home page
#  Then I should be on the home page
  
#Team: Rails (Spring 2019)
Scenario: See test scenario on scenario page
  #Given I am on the home page
  Then I should see "Welcome to the Ethics Game"

#Team: Rails (Spring 2019)  
Scenario: Go to scenario detail page
    #Given I am on the home page
    And I follow "Water Boiling"
    Then I should see "Water Boiling"
  