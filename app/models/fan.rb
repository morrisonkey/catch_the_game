class Fan < ActiveRecord::Base

  has_many :likes, as: :liker
  has_many :comments, as: :commenter

  # before_validation :downcase_email, :upcase_name

  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create
  # validates_presence_of :email
  # validates_uniqueness_of :name, :email

  def downcase_email
    self.email = email.downcase
  end

  def upcase_name
    self.username = username.upcase
  end

end
