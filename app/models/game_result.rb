class GameResult < ActiveRecord::Base
  before_save :set_winner
  
  belongs_to :game
  
  private
    def set_winner
      if self.home_team_goals > self.visitor_team_goals
        self.winner = 'h'
      elsif self.home_team_goals < self.visitor_team_goals
        self.winner = 'v'
      else
        self.winner = 'd'
      end
    end
end
