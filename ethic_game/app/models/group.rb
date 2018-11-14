class Group < ApplicationRecord
    belongs_to :scenario
    has_many :possible_questions, through: :groups_possible_questions
    
    def self.get_groups_in_history(histories)
        groups = Array.new
        self.all.each {
            |group|
            histories.each {
                |history|
                if group.id == history.group_id
                    if groups.length > 0
                    hit = false
                    groups.each {
                        |existing_group|
                        if group.id == existing_group.id
                            hit = true
                            break
                        end
                    }
                    if hit == false
                        groups.push(group)
                    end
                    else
                        groups.push(group)
                    end
                end
            }
        }
        return groups
    end
    
    def self.get_group_name(group_id)
        self.all.each {
            |group|
            if group.id == group_id
               return group.name 
            end
        }
    end
    
end