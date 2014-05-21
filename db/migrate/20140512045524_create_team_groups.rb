class CreateTeamGroups < ActiveRecord::Migration
  def change
    create_table :team_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
