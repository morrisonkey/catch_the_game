class Venue < ActiveRecord::Base

  belongs_to :user
  has_many :broadcasts, through: :events
  has_many :events
  has_many :likes, as: :likeable

  # before_validation :downcase_email, :upcase_name

  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create
  # validates_presence_of :email
  # validates_uniqueness_of :name, :email

  def downcase_email
    self.email = email.downcase
  end

  def upcase_name
    self.name = name.upcase
  end

end
