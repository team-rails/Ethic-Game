class PossibleResponse < ApplicationRecord
    
    def self.get_response_by_history_and_group(histories, active_group)
        responses = Array.new
        histories.each do |history|
            if history.group_id == active_group
                responses.push(PossibleResponse.find(history.possible_response_id).response)
            end
        end
        return responses
    end
    
    def self.get_possible_question_resposes(possible_question_id) 
        # Send in a group possible question id, returns all the possible responses for that question
        question_responses = PossibleQuestionsResponse.where("possible_question_id = ?", possible_question_id)
        return question_responses # this is a collection of qid&rid, if you want response(string), need to query possible_response
    end
    
    def self.get_possible_response(player_id, group_id, possible_question_id)
        possible_responses = PossibleResponse.get_possible_question_resposes(possible_question_id)
        player_group_standing = PlayerGroupStanding.get_player_standing_with_group(player_id, group_id)
        response = nil
        # based on player group standing, get response for the possible question
        # each possible response will have a group standing threshold (need to make a migration.)
        # based on the threshold filter through the responses and return a reply.
        
        return response
    end
    
end