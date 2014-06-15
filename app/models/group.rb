class Group < ActiveRecord::Base
	belongs_to :fan

	has_many :fans, through: :memberships
	has_many :memberships

	#has_many :likes, as: :liker
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
end
