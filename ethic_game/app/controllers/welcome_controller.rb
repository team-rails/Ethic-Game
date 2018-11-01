class WelcomeController < ApplicationController
  def index
    # This is default info til we get info from the db
    @scenarioNames = ["Test Scenario", "Water Boiling Exercise", "Team Building Exercise"];
  end
  
  def show
    @scenario = params[:name]
  end
end
