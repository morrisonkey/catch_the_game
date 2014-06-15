class Team < ActiveRecord::Base
  has_many :events, through: :broadcasts
  has_many :broadcasts
  # hope above line works
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  def home_broadcasts
    home_broadcast = Broadcast.where(home: self.sports_data_id)
    return home_broadcasts
  end

  def visitor_broadcasts
    visitor_broadcast = Broadcast.where(visitor: self.sports_data_id)
    return visitor_broadcasts
  end

  def broadcasts
    home_broadcasts = self.home_broadcasts
    visitor_broadcasts = self.visitor_broadcasts
    broadcasts = visitor_broadcasts + home_broadcasts
    return broadcasts
  end

end
