class Group < ActiveRecord::Base
	has_many :fans, through: :memberships
	has_many :memberships

	#has_many :likes, as: :liker
	has_many :likes, as: :likeable
	has_many :comments, as: :commentable
end
