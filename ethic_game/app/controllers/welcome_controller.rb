class WelcomeController < ApplicationController
  def index
    @scenarioNames = ["Test Scenario", "Water Boiling Exercise", "Team Building Exercise"];
  end
  
  def show
    puts "show called"
  end
end
