class Group < ApplicationRecord
    belongs_to :scenario
    has_many :possible_questions, through: :groups_possible_questions
    
    def self.get_groups_in_history(histories)
        groups = Array.new
        histories.each do |history|
            groups.push(Group.find(history.group_id))
        end
        return groups.uniq
    end
    
    def self.get_group_name(group_id)
        return Group.find(group_id).name
    end
    
end