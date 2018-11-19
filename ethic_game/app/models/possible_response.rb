class PossibleResponse < ApplicationRecord
    
    has_many :possible_questions_responses
    has_many :possible_questions, through: :possible_questions_responses
    
    def self.get_possible_response(player_id, group_id, possible_question_id)
        possible_responses = PossibleQuestion.get_possible_responses_sorted_by_threshold(possible_question_id)
        standing_score = PlayerGroupStanding.get_player_standing_with_group(player_id, group_id)
        response = nil
        
        # based on player group standing, get response for the possible question.
        # each possible response will have a group standing threshold
        # based on the group standing threshold filter through the responses and return a reply.
        possible_responses.each do |possible_response|
            if standing_score >= possible_response.group_standing_threshold # get the most accurate response
                response = possible_response
                break # exit loop
            else
                response = possible_response # get the last response if somehow nothing matches
            end
        end
        
        return response
    end
    
end