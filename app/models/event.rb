class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :broadcast

  has_many :fans, through: :fan_events
  has_many :fan_events
  has_many :groups, through: :group_events
  has_many :group_events
  has_many :teams, through: :team_broadcast
  has_one :team_broadcast, through: :broadcast
  has_one :broadcast
  # not so sure about the syntax on the lines above... might not work
end
