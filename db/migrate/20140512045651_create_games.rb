class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :home_team, index: true
      t.references :visitor_team, index: true
      t.datetime :play_at
      t.references :pool, index: true
      t.references :team_group, index: true

      t.timestamps
    end
  end
end
