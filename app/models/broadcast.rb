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
    todays_games = self.where(datetime: (Time.now.utc - 10.hour)..(Time.now.midnight.utc + 25.hour))
    return todays_games.order(:datetime)
  end

  #0 => today, 1 => tomorrow, 2 => two days from now, etc.
  def self.daily_broadcasts(days_from_now)
    morning_midnight = Time.now.midnight.utc + days_from_now.day
    daily_games = self.where(datetime: morning_midnight..(morning_midnight + 24.hour))
    return daily_games.order(:datetime)   
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
