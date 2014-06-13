class Group < ActiveRecord::Base
  # has_many :likes, as: :liker
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
end
