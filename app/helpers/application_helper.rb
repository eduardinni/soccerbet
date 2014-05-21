module ApplicationHelper
  def pool_user_points(pool, user)
    # Retrieve points directly from user_predictions
    # games = Game.where(pool: pool)
    # points = UserPrediction.where(game: games, user: user).sum(:points)
    # points.to_s.rjust(3, '0')
    pool_leaderboard = Leaderboard.new(pool.id, Leaderboard::DEFAULT_OPTIONS, {redis_connection: $redis})
    pool_leaderboard.score_for(user.id).to_i.to_s.rjust(3, '0') || '000'
  end
  
  def global_user_points(user)
    # Retrieve points directly from user_predictions
    # points = UserPrediction.where(user: user).sum(:points)
    # points.to_s.rjust(3, '0')
    global_leaderboard = Leaderboard.new('global', Leaderboard::DEFAULT_OPTIONS, {redis_connection: $redis})
    global_leaderboard.score_for(user.id).to_i.to_s.rjust(3, '0') || '000'
  end
  
  def pool_user_rank(pool, user)
    pool_leaderboard = Leaderboard.new(pool.id, Leaderboard::DEFAULT_OPTIONS, {redis_connection: $redis})
    pool_leaderboard.rank_for(user.id).to_s.rjust(3, '0') || '000'
  end
  
  def global_user_rank(user)
    global_leaderboard = Leaderboard.new('global', Leaderboard::DEFAULT_OPTIONS, {redis_connection: $redis})
    global_leaderboard.rank_for(user.id).to_s.rjust(3, '0') || '000'
  end
end
