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
    
end