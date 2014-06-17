class Team < ActiveRecord::Base
  has_many :events, through: :broadcasts
  has_many :broadcasts
  # hope above line works
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  def full_name
    "#{self.market} #{self.name}"
  end

  def home_broadcasts
    home_broadcasts = Broadcast.where(home: self.sports_data_id)
    return home_broadcasts
  end

  def visitor_broadcasts
    visitor_broadcasts = Broadcast.where(visitor: self.sports_data_id)
    return visitor_broadcasts
  end

  def broadcasts
    broadcasts = self.home_broadcasts + self.visitor_broadcasts
    return broadcasts.sort_by {|vn| vn[:datetime]}
  end

  def groups
    groups = []
    Group.all.each do |group|
      if group.name.include? self.name
        groups << group
      end
    end
    Group.all.each do |group|
      if group.bio.include? self.name
        groups << group
      end
    end
    Group.all.each do |group|
      if group.name.include? self.market
        groups << group
      end
    end
    Group.all.each do |group|
      if group.bio.include? self.market
        groups << group
      end
    end
    return groups
  end

  def self.todays_broadcasts
    todays_games = self.broadcasts.where(datetime: (Time.now.utc - 10.hour)..(Time.now.midnight.utc + 25.hour))
    return todays_games.order(:datetime)
  end

  #0 => today, 1 => tomorrow, 2 => two days from now, etc.
  def self.daily_broadcasts(days_from_now)
    morning_midnight = Time.now.midnight.utc + days_from_now.day
    daily_games = self.where(datetime: morning_midnight..(morning_midnight + 24.hour))
    return daily_games.order(:datetime)   
  end
end  
