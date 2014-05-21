json.array!(@game_results) do |game_result|
  json.extract! game_result, :id, :game_id, :home_team_goals, :visitor_team_goals, :winner
  json.url game_result_url(game_result, format: :json)
end
