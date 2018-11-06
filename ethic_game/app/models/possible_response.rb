class PossibleResponse < ApplicationRecord
    
    def self.get_response_by_history(histories)
        responses = Array.new
        self.all.each {
            |response|
            histories.each {
                |history|
                if history.possible_question_id == response.id
                   responses.push(response.response)
                end
            }
        }
        return responses
    end
    
end