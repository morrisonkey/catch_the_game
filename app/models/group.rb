class Group < ActiveRecord::Base
  has_many :broadcasts, as: :likable
  has_many :events, as: :likable
  has_many :venues, as: :likable
  has_many :fans, as: :likable
  has_many :teams, as: :likable
  has_many :likes
  has_many :comments
end
