module PoolsHelper
  def pool_leaderboard(pool)
    leaderboard = Leaderboard.new(pool.id, Leaderboard::DEFAULT_OPTIONS, {redis_connection: $redis})
    leaderboard.all_members
  end
  
  def global_leaderboard
    leaderboard = Leaderboard.new('global', Leaderboard::DEFAULT_OPTIONS, {redis_connection: $redis})
    leaderboard.all_members
  end
  
  def user_name_for(user_id)
    User.find(user_id).name || nil
  end
  
  def user_image_for(user_id)
    User.find(user_id).image || nil
  end
  
  def odds_for_home_team(game)
    if UserPrediction.where(game: game).exists?
      game_predictions_total = UserPrediction.where(game: game).count
      game_predictions_matched = UserPrediction.where(game: game, winner: 'h').count
      result = (game_predictions_matched.to_f / game_predictions_total.to_f) * 100
    else
      result = 0
    end  
    result.round(1) || 0
  end
  
  def odds_for_draw_game(game)
    if UserPrediction.where(game: game).exists?
      game_predictions_total = UserPrediction.where(game: game).count
      game_predictions_matched = UserPrediction.where(game: game, winner: 'd').count
      result = (game_predictions_matched.to_f / game_predictions_total.to_f) * 100
    else
      result = 0
    end
    result.round(1) || 0
  end
  
  def odds_for_visitor_team(game)
    if UserPrediction.where(game: game).exists?
      game_predictions_total = UserPrediction.where(game: game).count
      game_predictions_matched = UserPrediction.where(game: game, winner: 'v').count
      result = (game_predictions_matched.to_f / game_predictions_total.to_f) * 100
    else
      result = 0
    end
    result.round(1) || 0
  end
end
