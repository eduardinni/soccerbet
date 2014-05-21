class AddShortnameToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :shortname, :string
  end
end
