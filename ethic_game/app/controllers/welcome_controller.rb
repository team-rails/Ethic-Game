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
    #@history_length = @histories.size-1
    
    @groups = Group.get_groups_in_history(@histories)
    @number_of_groups = @groups.size-1
    #@active_group = 0
    if(params.has_key?(:active))
      @active_group = params[:active].to_i
      
    else
      @active_group = 1
    end
    @active_group_name = Group.get_group_name(@active_group)
    
    @question_history = PossibleQuestion.get_question_by_history_and_group(@histories, @active_group)
    @response_history = PossibleResponse.get_response_by_history_and_group(@histories, @active_group)
    @number_of_questions = @question_history.size-1
    
  end
  
  def show_history
    
  end
  
end
