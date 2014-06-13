likeableclass Team < ActiveRecord::Base
  has_many :events, through: :broadcasts
  # hope above line works
  has_many :broadcasts, as: :likeable
  has_many :groups, as: :likeable
  has_many :fans, as: :likeable
  has_many :venues, as: :likeable
  has_many :likes
  has_many :comments
end
