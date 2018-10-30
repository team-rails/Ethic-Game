class WelcomeController < ApplicationController
  def index
    @scenarioNames = ["Scenario 1", "Scenario 2", "Scenario 3"];
  end
  
  def show
    puts "show called"
  end
end
