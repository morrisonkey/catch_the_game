class Group < ActiveRecord::Base
  has_many :broadcasts, through: :group_broadcasts
  has_many :group_broadcasts
  has_many :group_broadcast_comments
  has_many :events, through: :group_events
  has_many :group_events
  has_many :venues, through: :group_venues
  has_many :group_venues
  has_many :fans, through: :fan_groups
  has_many :fan_groups
  has_many :fan_group_comments
  has_many :teams, through: :group_teams
  has_many :group_teams
  has_many :group_team_comments
end
