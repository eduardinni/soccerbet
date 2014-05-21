json.array!(@games) do |game|
  json.extract! game, :id, :home_team_id, :visitor_team_id, :datetime, :pool_id, :team_group_id
  json.url game_url(game, format: :json)
end
