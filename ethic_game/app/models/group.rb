class Group < ApplicationRecord
    belongs_to :scenario
    has_many :possible_questions, through: :groups_possible_questions
end