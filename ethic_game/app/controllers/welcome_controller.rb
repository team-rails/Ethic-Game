class WelcomeController < ApplicationController
  def index
    # This is default info til we get info from the db
    #@scenarioNames = ["Test Scenario", "Water Boiling Exercise", "Team Building Exercise"];
    @scenarioNames = Scenario.get_all_scenarios
    
    @scenarios = Scenario.all
  end
  
  def detail
    #@scenario = params[:scenario]
    id = params[:id] # retrieve movie ID from URI route
    @scenario = Scenario.find(id) # look up movie by unique ID
  end
  
  def show
    #@scenario = params[:scenario]
    id = params[:id] # retrieve movie ID from URI route
    @scenario = Scenario.find(id) # look up movie by unique ID
    
    # For now assume only one player
    @player = Player.find(1)
    
    @histories = PlayerHistory.get_player_history(@player)
    @history_length = @histories.size
    
    @question_history = PossibleQuestion.get_question_by_history(@histories)
    @response_history = PossibleResponse.get_response_by_history(@histories)
    
  end
  
  def show_history
    
  end
  
end
