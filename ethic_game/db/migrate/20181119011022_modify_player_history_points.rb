class ModifyPlayerHistoryPoints < ActiveRecord::Migration[5.2]
  def change
    rename_column :player_histories, :points, :points_earned
  end
end
