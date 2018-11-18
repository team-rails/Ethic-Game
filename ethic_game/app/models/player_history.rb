class PlayerHistory < ApplicationRecord
    belongs_to :player
    
    def self.get_player_history(player)
        return PlayerHistory.where(player_id: player.id)
    end
    
    def self.get_question_history(player)
        qhid = PlayerHistory.where(player_id: player.id).map(&:possible_question_id)
        return qhid
    end
    
    def self.get_question_history(player)
        rhid = PlayerHistory.where(player_id: player.id).map(&:possible_response_id)
        return rhid
    end
    
    def self.update_player_history(scenario_id, player_id, group_id, possible_question_id, possible_response_id, points, notes)
        # update the player history table with entry of this interation.
    end
    
end