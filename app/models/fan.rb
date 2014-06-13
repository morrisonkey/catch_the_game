class Fan < ActiveRecord::Base

  has_many :broadcasts, through: :fan_broadcasts
  has_many :fan_broadcasts
  has_many :fan_broadcast_comments
  has_many :events, through: :fan_events
  has_many :fan_events
  has_many :venues, through: :fan_venues
  has_many :fan_venues
  has_many :groups, through: :fan_groups
  has_many :fan_groups
  has_many :fan_group_comments
  has_many :teams, through: :fan_teams
  has_many :fan_teams
  has_many :fan_team_comments

  before_validation :downcase_email, :upcase_name

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :name, :email

  def downcase_email
    self.email = email.downcase
  end

  def upcase_name
    self.name = name.upcase
  end

end
