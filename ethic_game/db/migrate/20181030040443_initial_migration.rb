class InitialMigration < ActiveRecord::Migration[5.2]
  def self.up
    ActiveRecord::Base.transaction do
      
      create_table :players do |t|
        t.string :name
      end
      
      create_table :scenarios do |t|
        t.string :title
        t.string :description
        t.string :created_by
      end
      
      create_table :groups do |t|
        t.string :name
        t.integer :population_percentage
        t.references :scenario, index: true, foreign_key: true
      end
      
      create_table :possible_questions do |t|
        t.string :question
        t.decimal :points
      end
      
      create_join_table :groups, :possible_questions
      
      create_table :possible_responses do |t|
        t.string :response
      end
      
      create_join_table :possible_questions, :possible_responses
      
      create_table :player_group_standings do |t|
        t.references :player, index: true, foreign_key: true
        t.references :group, index: true, foreign_key: true
        t.decimal :current_standing
      end
      
      create_table :player_history do |t|
        t.references :scenario, index: true, foreign_key: true
        t.references :player, index: true, foreign_key: true
        t.references :group, index: true, foreign_key: true
        t.references :possible_question, index: true, foreign_key: true
        t.references :possible_response, index: true, foreign_key: true
        t.decimal :points
        t.string :notes
      end
      
    end
  end
  
  def self.down
    ActiveRecord::Base.transaction do
      drop_table :player_history
      drop_table :player_group_standings
      drop_table :possible_questions_responses
      drop_table :possible_responses
      drop_table :groups_possible_questions
      drop_table :possible_questions
      drop_table :groups
      drop_table :scenarios
      drop_table :players
    end
  end
end
