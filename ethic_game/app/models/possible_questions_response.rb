class PossibleQuestionsResponse < ApplicationRecord
    belongs_to :possible_question
    belongs_to :possible_response
end