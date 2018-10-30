class PossibleQuestion < ApplicationRecord
    has_many :possible_responses, through: :possible_questions_responses
end