class PlayerGroupStanding < ApplicationRecord
    belongs_to :player
    belongs_to :group
    
    def self.get_player_standing_with_group(player_id, group_id)
        #get the player standing with current group
        standing_record = PlayerGroupStanding.where(player_id: player_id, group_id: group_id).first
        return standing_record.current_standing
    end
    
    def self.update_player_group_standing(player_id, group_id, question_points, response_points)
        # update the standing here
        player_group_standing = PlayerGroupStanding.where(player_id: player_id, group_id: group_id).first
        previous_standing = player_group_standing.current_standing
        points_earned = question_points + response_points
        new_standing = previous_standing + points_earned
        
        if(new_standing < 0)
            new_standing = 0
        elsif(new_standing > 100)
            new_standing = 100
        end
        
        player_group_standing.current_standing = new_standing
        player_group_standing.save
        
        return (new_standing - previous_standing)
    end
end