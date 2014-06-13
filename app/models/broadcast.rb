class Broadcast < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  has_many :venues, through: :events
  has_many :events
  has_many :fans, as: :likable
  has_many :groups, as: :likable
  has_many :teams, as: :likable
  has_many :likes
  has_many :comments
end
