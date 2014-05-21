json.array!(@user_predictions) do |user_prediction|
  json.extract! user_prediction, :id, :user_id, :game_id, :home_team_goals, :visitor_team_goals, :winner, :points
  json.url user_prediction_url(user_prediction, format: :json)
end
