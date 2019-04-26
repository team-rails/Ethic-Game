class WelcomeController < ApplicationController
  def index
    # This is default info til we get info from the db
    #@scenarioNames = ["Test Scenario", "Water Boiling Exercise", "Team Building Exercise"];
    @scenarioNames = Scenario.get_all_scenario_titles
    
    @scenarios = Scenario.all
  end
  
  def detail
    id = params[:id] # retrieve movie ID from URI route
    @scenario = Scenario.find(id) # look up movie by unique ID
  end
  
  def create_player
    player_name = params[:name]
    scenario_id = params[:scenario_id]
    
    player = Player.create!(
      name: player_name
    )
    
    session[:player_id] = player.id
    
    groups = Group.where(scenario_id: scenario_id).all()
    
    groups.each do |group|
      PlayerGroupStanding.create!(
        player_id: player.id,
        group_id: group.id,
        current_standing: 100,
      )
    end
    redirect_to show_history_path(params[:scenario_id], params[:active_id]) and return
  end
  
  def show_history

    id = params[:id] # retrieve movie ID from URI route
    player_id = session[:player_id]
    @scenario = Scenario.find(id) # look up movie by unique ID
    
    # For now assume only one player
    @player = Player.find(player_id)
    
    @available_groups = Group.all
    if @available_groups.nil?
      flash[:notice] = "No Groups available"
      return
    end
    
    @active_group = nil
    if(params.has_key?(:active_id))
      @active_group = Group.find(params[:active_id].to_i)
    else
      @active_group = Group.first
    end
    
    @group_possible_questions = Group.get_possible_questions(@active_group.id)
    @player_group_standing = PlayerGroupStanding.where(player_id: @player.id, group_id: @active_group.id).first()
    
    @histories = PlayerHistory.get_player_group_history(@player.id, @active_group.id)
    
  end
  
  def reply_to_question
    
    id = params[:id] # retrieve movie ID from URI route
    scenario = Scenario.find(id) # look up movie by unique ID
    
    # For now assume only one player
    player = Player.find(session[:player_id])

    active_group = nil
    if(params.has_key?(:active_id))
      active_group = Group.find(params[:active_id].to_i)
    else
      flash[:notice] = "No Group Selected"
      redirect_to show_history_path(params[:id]) and return
    end
    
    #Test code for getQuestionResponses
    asked_question = params[:user_question]
    if asked_question == '' or asked_question.nil? 
      redirect_to show_history_path(params[:id], params[:active_id]) and return
    end
    
    
    #map the question is database
    possible_question = PossibleQuestion.get_possible_question(active_group.id, asked_question)
    @test_question = possible_question
    
    if possible_question.nil?
      flash[:notice] = "Question was not recognized, please try again."
      redirect_to show_history_path(params[:id], params[:active_id]) and return
    end
    
    #get the appropriate response based on player standing with the group (the standing acts as consequences in the model.)
    possible_response = PossibleResponse.get_possible_response(player.id, active_group.id, possible_question.id)
    @test_response = possible_response
    
    if possible_response.nil? # ideally this should never happen as there should be a response if we have a question.
      flash[:error] = "Something went wrong while generating a response"
      redirect_to show_history_path(params[:id], params[:active_id]) and return
    end
    
    #update group standing (Possible increase or decrease, or neutral)
    points_earned = PlayerGroupStanding.update_player_group_standing(player.id, active_group.id, possible_question.points, possible_response.points)
    
    #update player history
    PlayerHistory.update_player_histories(scenario.id, player.id, active_group.id, possible_question.id, possible_response.id, points_earned, '')
    
    redirect_to show_history_path(params[:id], params[:active_id]) and return
  
  end
  
end
