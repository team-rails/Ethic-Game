class PossibleQuestion < ApplicationRecord
    has_many :possible_questions_responses
    has_many :possible_responses, through: :possible_questions_responses
    has_many :groups_possible_questions
    has_many :groups, through: :groups_possible_questions
    
    def self.get_possible_responses_sorted_by_threshold(possible_question_id)
        possible_question = PossibleQuestion.find(possible_question_id)
        return possible_question.possible_responses.order('group_standing_threshold DESC').all
    end
    
    def self.get_possible_question(group_id, asked_question)
        possible_questions_for_group = Group.get_possible_questions(group_id) #GroupsPossibleQuestion.get_all_questions_for_a_group(group_id)
        
        # do fuzzy matching
        fz = FuzzyMatch.new(possible_questions_for_group, :read => :question)
        possible_question = fz.find(asked_question)
        
        if !possible_question.nil?
            puts "mapped question: "
            puts possible_question.question 
        else
            puts "NO QUESTION MATCH"
        end
        
        return possible_question
    end
    
end