class Team < ActiveRecord::Base
  has_many :broadcasts, through: :team_broadcasts
  has_many :team_broadcasts
  has_many :events, through: :broadcasts
  # hope above line works
  has_many :fans, through: :fan_teams
  has_many :fan_teams
  has_many :fan_team_comments
  has_many :groups, through: :group_teams
  has_many :group_teams
  has_many :group_team_comments
  has_many :venues, through: :team_venues
  has_many :team_venues
end
