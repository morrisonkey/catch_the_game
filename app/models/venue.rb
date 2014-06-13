class Venue < ActiveRecord::Base

  has_many :broadcasts, through: :events
  has_many :events
  has_many :fans, as: :likeable
  has_many :groups, as: :likeable
  has_many :teams, as: :likeable
  has_many :likes

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
