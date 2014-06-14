class Broadcast < ActiveRecord::Base
  has_many :likes, as: :likeable
  has_many :venues, through: :events
  has_many :events
  has_many :comments, as: :commentable



  def visitor_team
  	team = Team.where(sports_data_id: self.visitor)
  	return team[0]
  end

  def home_team
  	team = Team.where(sports_data_id: self.home)
  	return team[0]
  end

end
