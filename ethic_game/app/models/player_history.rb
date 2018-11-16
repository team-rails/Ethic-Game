class PlayerHistory < ApplicationRecord
    belongs_to :player
    
    def self.get_player_history(player)
        histories = Array.new
        self.all.each {
            |history|
            if history.player_id == player.id
               histories.push(history)
            end
        }
        return histories
    end
    
    def self.get_question_history(player)
        qhid = Array.new
        self.all.each {
            |history|
            if history.player_id == player.id
               qhid.push(history.possible_question_id)
            end
        }
        return qhid
    end
    
    def self.get_question_history(player)
        rhid = Array.new
        self.all.each {
            |history|
            if history.player_id == player.id
               rhid.push(history.possible_response_id)
            end
        }
        return rhid
    end
    
    def self.update_player_history(scenario_id, player_id, group_id, possible_question_id, possible_response_id, points, notes)
        # update the player history table with entry of this interation.
    end
    
end