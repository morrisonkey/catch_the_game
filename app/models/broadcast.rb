class Broadcast < ActiveRecord::Base
  has_many :likes, as: :likeable
  has_many :venues, through: :events
  has_many :events
  has_many :comments, as: :commentable
end
