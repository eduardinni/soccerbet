class CreateUserPredictions < ActiveRecord::Migration
  def change
    create_table :user_predictions do |t|
      t.references :user, index: true
      t.references :game, index: true
      t.integer :home_team_goals
      t.integer :visitor_team_goals
      t.string :winner
      t.integer :points

      t.timestamps
    end
  end
end
