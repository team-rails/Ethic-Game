class AddPointsAndThresholdToPossibleResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :possible_responses, :points, :decimal
    add_column :possible_responses, :group_standing_threshold, :decimal
  end
end
