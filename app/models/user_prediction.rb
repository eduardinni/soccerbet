class UserPrediction < ActiveRecord::Base
  before_save :set_winner
  
  belongs_to :user
  belongs_to :game
  
  validates_uniqueness_of :game_id, scope: :user_id, on: :create
  validates :game_id, presence: true
  validates_numericality_of :home_team_goals, only_integer: true, allow_nil: true
  validates_numericality_of :visitor_team_goals, only_integer: true, allow_nil: true
  
  private
    def set_winner
      if self.home_team_goals.nil? or  self.visitor_team_goals.nil?
        self.home_team_goals = nil
        self.visitor_team_goals = nil
        self.winner = ''
        return
      end
      
      if self.home_team_goals > self.visitor_team_goals
        self.winner = 'h'
      elsif self.home_team_goals < self.visitor_team_goals
        self.winner = 'v'
      else
        self.winner = 'd'
      end
    end
end
