require 'simplecov'
require "rails_helper"
SimpleCov.start 'rails'

require_relative '../app/helpers/welcome_helper'

describe 'Test the welcome_helper' do
  describe '#welcome' do
      
    class DummyClass
    end
      
    before(:each) do
        @dummy_class = DummyClass.new 
        @dummy_class.extend(WelcomeHelper)
    end
      
    it 'should be defined' do
      expect { @dummy_class }.not_to raise_error
    end
    
  end
end

describe 'Model tests' do 
  scenario = Scenario.create!(
    title: 'Water Boiling',
    description: 'Test',
    created_by: 'me'
    )
    player = Player.create!(
      name: "test name"
    )
    groupA = Group.create!(
      name: 'Village Group A', 
      population_percentage: 80,
      scenario_id: scenario.id
    )
    PlayerGroupStanding.create!(
      player_id: player.id,
      group_id: groupA.id,
      current_standing: 100,
    )
  question_obj = PossibleQuestion.create!(
    question: "Test Question",
    points: 10,
    )
  response_obj = PossibleResponse.create!(
    response: 'test response',
    points: 10,
    group_standing_threshold: 10
    )
  GroupsPossibleQuestion.create!(
    group_id: groupA.id,
    possible_question_id: question_obj.id
    )
  PossibleQuestionsResponse.create!(
    possible_question_id: question_obj.id,
    possible_response_id: response_obj.id
    )
  describe 'Group model tests' do 
    it 'Should return a groups question' do 
      possible_questions = Group.get_possible_questions(groupA.id)
      possible_question = possible_questions[0];
      possible_question.question.should == "Test Question"
    end
  end
  describe 'Possible question test' do 
    it 'Should return a possible question from the asked question' do
      possible_question = PossibleQuestion.get_possible_question(groupA.id, "Test Ques")
      possible_question.question.should == "Test Question"
    end
  end
  describe 'Possible response test' do 
    it 'Should return a possible response' do 
      possible_response = PossibleResponse.get_possible_response(player.id, groupA.id, question_obj.id)
      possible_response.response.should == "test response"
    end
  end
  describe 'Group player standing test' do 
    it 'Should return 0' do 
      points_earned = PlayerGroupStanding.update_player_group_standing(player.id, groupA.id, question_obj.points, response_obj.points)
      points_earned.should == 0
    end
  end
  describe WelcomeController, :type => :controller do 
    describe 'Tests reply_to_question method' do 
      it 'Should have a question and response' do 
        get :reply_to_question, params: {'id' => scenario.id, 'active_id' => groupA.id, 'user_question' => "Test Quest"}, session: {'player_id' => player.id}
        response.body.should_not == nil
      end
    end
  end
end
