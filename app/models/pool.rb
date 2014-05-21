class Pool < ActiveRecord::Base
  has_many :games
  
  validates :name, presence: true
  
  default_scope { where(active: true) }
end
