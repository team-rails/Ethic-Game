class PlayerGroupStanding < ApplicationRecord
    belongs_to :player
    belongs_to :group
    
    def get_player_standing_with_group(player_id, group_id)
        #get the player standing with current group
    end
    
    def update_player_group_standing(player_id, group_id, current_standing)
        # update the standing here
    end
end