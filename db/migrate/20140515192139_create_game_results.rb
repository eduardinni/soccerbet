class CreateGameResults < ActiveRecord::Migration
  def change
    create_table :game_results do |t|
      t.references :game, index: true
      t.integer :home_team_goals
      t.integer :visitor_team_goals
      t.string :winner

      t.timestamps
    end
  end
end
