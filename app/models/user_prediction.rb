class UserPrediction < ActiveRecord::Base
  before_save :set_winner
  
  belongs_to :user
  belongs_to :game
  
  validates_uniqueness_of :game_id, scope: :user_id, on: :create
  validates :home_team_goals, :visitor_team_goals, :game_id, presence: true
  validates_numericality_of :home_team_goals, only_integer: true
  validates_numericality_of :visitor_team_goals, only_integer: true
  
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
