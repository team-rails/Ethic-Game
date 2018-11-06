class Scenario < ApplicationRecord
    has_many :groups
    
    def self.get_all_scenarios
        scenarios = Array.new
        self.select("title").distinct.each {
            |scenario| scenarios.push(scenario.title)
        }
        return scenarios.sort
    end
end