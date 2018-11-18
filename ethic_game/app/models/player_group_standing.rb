class PlayerGroupStanding < ApplicationRecord
    belongs_to :player
    belongs_to :group
    
    def get_player_standing_with_group(player_id, group_id)
        #get the player standing with current group
        standing_record = PlayerGroupStanding.where(player_id: player_id, group_id: group_id)
        return standing_record.current_standing
    end
    
    def update_player_group_standing(player_id, group_id, current_standing)
        # update the standing here
        standing_record = PlayerGroupStanding.where(player_id: player_id, group_id: group_id)
        standing_record.update(current_standing: current_standing)
    end
end