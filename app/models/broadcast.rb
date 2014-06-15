class Broadcast < ActiveRecord::Base
  include ApplicationHelper

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

  def title
    return "#{self.visitor_team.name} @ #{self.home_team.name}"
  end

  def self.todays_broadcasts
    games = self.where(datetime: (Time.now.utc - 2.hour)..(Time.now.midnight.utc + 25.hour))
    return games.order(:datetime)
  end

  #getter
  def date_and_year
    from_UTC_to_EST(self.datetime).strftime("%B %-d, %Y")
  end

  def time
    from_UTC_to_EST(self.datetime).strftime("%-I:%M %p")
  end
  
  
  #temporary method
  def self.pretty_print
      self.todays_games.each do |game|
        puts game
      end
  end

end
