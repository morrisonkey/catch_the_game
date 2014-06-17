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
    return broadcasts
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
end  
