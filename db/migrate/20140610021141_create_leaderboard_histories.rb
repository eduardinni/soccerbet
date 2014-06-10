class CreateLeaderboardHistories < ActiveRecord::Migration
  def change
    create_table :leaderboard_histories do |t|
      t.references :user, index: true
      t.string :pool
      t.integer :rank

      t.timestamps
    end
  end
end
