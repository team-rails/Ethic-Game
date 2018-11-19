class PlayerHistory < ApplicationRecord
    belongs_to :player
    belongs_to :possible_question
    belongs_to :group
    belongs_to :scenario
    belongs_to :possible_response
    
    def self.get_player_group_history(player_id, group_id)
        return PlayerHistory.where(player_id: player_id, group_id: group_id).all
    end
    
    def self.update_player_histories(scenario_id, player_id, group_id, possible_question_id, possible_response_id, points_earned, notes)
        # update the player history table with entry of this interation.
        PlayerHistory.create!(
            scenario_id: scenario_id,
            player_id: player_id,
            group_id: group_id,
            possible_question_id: possible_question_id,
            possible_response_id: possible_response_id,
            points_earned: points_earned,
            notes: notes
        )
    end
    
end