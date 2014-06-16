class Group < ActiveRecord::Base
	belongs_to :fan

	has_many :fans, through: :memberships
	has_many :memberships

	has_many :likes, as: :liker
	has_many :likes, as: :likeable
	has_many :comments, as: :commentable

  #I was able to slim to below down by adding the belongs_to :fan relationship up top
  def leader
    self.fan
  end

  #A settor using creator to complete the above getter.  Now, we can just use the word creator whereever we would have otherwise used the word fan in relation to a Group.
  def leader=(leader_id)
  	self.fan_id = leader_id
  end

  def likes
    liked = []
    likes = []
    Like.all.each do |like|
      if like.liker_type == self.class.name and like.liker_id == self.id
        likes << like
      end
    end
    return likes
  end

  def broadcasts
    likes = self.likes
    broadcasts = []
    likes.each do |like|
      if like.likeable_type = "Broadcast"
        broadcasts << Broadcast.find_by_id(like.likeable_id)
      end
    end
    return broadcasts
  end

  def venues
    likes = self.likes
    venues = []
    likes.each do |like|
      if like.likeable_type = "Venue"
        venues << Venue.find_by_id(like.likeable_id)
      end
    end
    return venues
  end

    def events
    likes = self.likes
    events = []
    likes.each do |like|
      if like.likeable_type = "Event"
        events << Event.find_by_id(like.likeable_id)
      end
    end
    return events
  end

  def home_team
    team = Team.where(sports_data_id: self.home)
    return team[0]
  end
end
