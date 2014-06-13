class Team < ActiveRecord::Base
  has_many :events, through: :broadcasts
  # hope above line works
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
end
