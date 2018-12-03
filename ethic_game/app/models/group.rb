class Group < ApplicationRecord
    belongs_to :scenario
    has_many :groups_possible_questions
    has_many :possible_questions, through: :groups_possible_questions
    
    def self.get_possible_questions(group_id)
        group = Group.find(group_id)
        return group.possible_questions
    end
    
end