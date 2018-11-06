class PossibleQuestion < ApplicationRecord
    has_many :possible_responses, through: :possible_questions_responses
    
    def self.get_question_by_history(histories)
        questions = Array.new
        self.all.each {
            |question|
            histories.each {
                |history|
                if history.possible_question_id == question.id
                   questions.push(question.question)
                end
            }
        }
        return questions
    end
    
end