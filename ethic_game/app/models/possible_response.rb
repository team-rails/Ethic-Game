class PossibleResponse < ApplicationRecord
    
    def self.get_response_by_history_and_group(histories, active_group)
        responses = Array.new
        self.all.each {
            |response|
            histories.each {
                |history|
                if history.possible_question_id == response.id && history.group_id == active_group
                   responses.push(response.response)
                end
            }
        }
        return responses
    end
    
end