class Scenario < ApplicationRecord
    has_many :groups
    
    def self.get_all_scenario_titles
        return Scenario.distinct.pluck(:title).sort
    end
end