class Game < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  belongs_to :pool
  belongs_to :team_group
  has_one :game_result
  
  validates :home_team, :visitor_team, :pool, presence: true
  
  default_scope { order('play_at ASC') }
  
  def pool
    Pool.unscoped { super }
  end
  
  def ontime_to_edit?
    if (self.play_at - 1.hour) > Time.zone.now
      true
    else
      false
    end
  end
end
