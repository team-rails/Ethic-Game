class PlayerGroupStanding < ApplicationRecord
    belongs_to :player
    belongs_to :group
end