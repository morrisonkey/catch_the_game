class Venue < ActiveRecord::Base

  has_many :broadcasts, through: :events
  has_many :events
  has_many :fans, through: :fan_venues
  has_many :fan_venues
  has_many :groups, through: :group_venues
  has_many :group_venues
  has_many :teams, through: :team_venues
  has_many :team_venues

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
