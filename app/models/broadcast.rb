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

  def title
    return "#{self.visitor_team.name} vs. #{self.home_team.name}"
  end

  def self.todays_broadcasts
    #Time.now.midnight - 1.day
    games = self.where(datetime: (Time.now.utc - 2.hour)..(Time.now.midnight.utc + 25.hour))
    sorted_games = games.order(:datetime)

  end

  #getter
  def date_and_year
    self.datetime.strftime("%B %-d, %Y")
  end
  
  def schedule(day)

  end

  
  #temporary method
  def self.pretty_print
      self.todays_games.each do |game|
        puts game
      end
  end

end
