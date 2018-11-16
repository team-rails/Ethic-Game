class PossibleQuestion < ApplicationRecord
    has_many :possible_responses, through: :possible_questions_responses
    
    def self.get_question_by_history_and_group(histories, active_group)
        questions = Array.new
        self.all.each {
            |question|
            histories.each {
                |history|
                if history.possible_question_id == question.id && history.group_id == active_group
                   questions.push(question.question)
                end
            }
        }
        return questions
    end
    
    def self.get_possible_question(group_id, asked_question)
        possible_questions_for_group = GroupsPossibleQuestion.get_all_group_questions(group_id)
        possible_question = nil
        
        # do fuzzy matching or some ML technique here
        
        return possible_question
    end
    
end