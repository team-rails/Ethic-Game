class GroupsPossibleQuestion < ApplicationRecord
    belongs_to :group
    belongs_to :possible_question
    
    def self.get_all_group_questions(group_id)
       possible_questions_for_group = GroupsPossibleQuestion.where("group_id = ?", group_id)
       return possible_questions_for_group
    end
    
end