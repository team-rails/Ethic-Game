class WelcomeController < ApplicationController
  def index
    # This is default info til we get info from the db
    #@scenarioNames = ["Test Scenario", "Water Boiling Exercise", "Team Building Exercise"];
    @scenarioNames = Scenario.get_all_scenario_titles
    
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
    
    #Test code for getQuestionResponses
    groups = Group.all
    group = groups[0]
    asked_question = params[:user_question]
    if asked_question == '' or asked_question.nil? 
      return
    end
    
    
    possible_question = PossibleQuestion.get_possible_question(group.id, asked_question)
    
    if possible_question.nil?
      flash[:notice] = "Question was not recognized, please try again."
      return
    end
    
    possible_response = PossibleResponse.get_possible_response(@player.id, group.id, possible_question.id)
    
    if possible_response.nil? # ideally this should never happen as there should be a response if we have a question.
      flash[:error] = "Something went wrong while generating a response"
      return
    end
    
    # update group standing
    current_standing = 1
    PlayerGroupStanding.update_player_group_standing(@player.id, group.id, current_standing)
    
    
    # update player history
    points_earned = 1
    notes = ''
    PlayerHistory.update_player_history(@scenario.id, @player.id, group.id, possible_question.id, possible_response.id, points_earned, notes)
    
    #group_possible_question = group_possible_questions[0];
    #puts("Group possible questions = #{group_possible_question}")
    #responses = getQuestionResponses(group_possible_question)
    #responses.each do |resp|
    #  puts("Response is #{resp.response}")
    #end
    
  end
  
  def show_history
    
  end
  
  #def getQuestionResponses(group_question) 
    # Send in a group possible question, returns all the possible responses for that question
  #  responses = []
  #  question_responses = PossibleQuestionsResponse.where("possible_question_id = ?", group_question.possible_question_id)
  #  question_responses.each do |question_response|
      #Loop through all the questions responses objects and gets there possible response
      
  #    resp = question_response.possible_response
  #    responses.push(resp)
  #  end
  #  return responses
  #end
  
end
