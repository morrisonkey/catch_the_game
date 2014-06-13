class Broadcast < ActiveRecord::Base
  has_many :fans, through: :fan_broadcasts
  has_many :fan_broadcasts
  has_many :fan_broadcast_comments
  has_many :groups, through: :group_broadcasts
  has_many :group_broadcasts
  has_many :group_broadcast_comments
  has_many :venues, through: :events
  has_many :events
  has_many :teams, through: :team_broadcasts
  has_many :team_broadcasts
end
